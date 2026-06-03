variable "proxmox_api_url" {
  type         = string
  description  = "URL to Proxmox API"
}

variable "proxmox_api_token_id" {
  type         = string
  sensitive    = true
}

variable "proxmox_api_token_secret" {
  type         = string
  sensitive    = true
}

variable "ssh_public_key" {
  type         = string
  description  = "Computer public SSH key"
}

```hcl
variable "vm_ip_address" {
  type        = string
  description = "The IP address for the new VM (e.g., 10.0.0.150/24)"
  default     = "10.0.0.150/24"
}

variable "vm_gateway" {
  type        = string
  description = "The network gateway (e.g., 10.0.0.1)"
  default     = "10.0.0.1"
}

variable "vm_network_bridge" {
  type        = string
  description = "The network bridge"
  default     = "vmbr1"
}
