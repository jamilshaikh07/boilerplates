# Moving StatefulSet Pods Between Availability Zones in AWS EKS

## Overview
In AWS EKS, managing StatefulSets can present unique challenges, particularly when you need to move pods between availability zones (AZs). This guide details a practical example of migrating StatefulSet pods while maintaining data integrity and availability.

## Understanding StatefulSets
### What is a StatefulSet?
A **StatefulSet** in Kubernetes is a controller that manages the deployment of stateful applications. It ensures that each pod has a unique identity and maintains persistent storage, allowing for reliable data persistence across pod restarts. This is crucial for applications that require stable storage, like databases.

## Scenario
In this case, there was a need to move StatefulSet pods from availability zone **us-east-1b** to **us-east-1a** due to specific project requirements.

### Challenges Faced
- **High Availability**: The production environment required that the application remain highly available throughout the migration.
- **Cross-AZ Volume Attachment**: The primary issue was that EBS volumes attached to pods in **us-east-1b** could not be directly moved to nodes in **us-east-1a** due to AWS's restrictions on cross-AZ volume attachments.

## Migration Steps
### 1. Cordoning Nodes in us-east-1b
To prevent any new pods from being scheduled on the nodes in **us-east-1b**, we cordoned them:
```bash
kubectl cordon <node-name>
```
**Example**:
```bash
kubectl cordon ip-10-4-158-210.ec2.internal
kubectl cordon ip-10-4-158-211.ec2.internal
kubectl cordon ip-10-4-158-212.ec2.internal
```

### 2. Draining the Node Running the ReplicaSet Pod
Next, the node hosting the StatefulSet pod was drained. This command safely removes all non-DaemonSet pods from the node, preparing it for maintenance:
```bash
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data
```
**Example**:
```bash
kubectl drain ip-10-4-158-211.ec2.internal --ignore-daemonsets --delete-emptydir-data
```

### 3. PVC Cleanup
#### What is PVC?
A **PersistentVolumeClaim (PVC)** is a request for storage by a pod, allowing it to utilize a **PersistentVolume (PV)** that provides stable, long-term storage.

After the node (e.g., `ip-10-4-158-211.ec2.internal`) is deleted, the PVC may need to be manually freed up if it gets stuck in a terminating state. To handle this:
- Forcefully remove the PVC by updating the finalizers:
```bash
kubectl patch pvc <pvc_name> -p '{"metadata":{"finalizers":null}}'
kubectl patch pv <pv_id> -p '{"metadata":{"finalizers":null}}'
```
- Delete the PVC and the associated PV:
```bash
kubectl delete pvc <pvc_name> --grace-period=0 --force
kubectl delete pv <pv_id>
kubectl delete pod <pod_name>
```

### 4. Recreation of Pods
Once the PVC has been successfully removed, the StatefulSet controller will recreate the pods, generating new PVCs that can be attached to nodes in **us-east-1a**. 

## Conclusion
By following these steps, the StatefulSet pods can be effectively migrated to another availability zone without compromising data integrity or application availability. This process highlights the importance of understanding Kubernetes architecture and AWS limitations when managing cloud-native applications.
