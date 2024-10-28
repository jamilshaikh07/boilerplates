variable "proxmox_api_url" {
  type        = string
  default     = ""
  description = "proxmox_api_url"
}
variable "proxmox_api_token_id" {
  type        = string
  default     = ""
  description = "proxmox_api_token_id"
}
variable "proxmox_api_token_secret" {
  type        = string
  default     = ""
  description = "proxmox_api_token_secret"
}
variable "vm_name" {
  type        = string
  default     = ""
  description = "vm_name"
}
variable "memory" {
  type        = number
  default     = 2048
  description = "memory"
}
variable "cores" {
  type        = number
  default     = 2
  description = "cores"
}
variable "ipconfig0" {
  type        = string
  default     = ""
  description = "ipconfig0"
}
