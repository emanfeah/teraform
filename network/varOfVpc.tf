variable "cidr_block" {
  default     = "192.168.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = "192.168.1.0/24"
  type        = string
  description = "the public subnet CIDR blocks"
}

