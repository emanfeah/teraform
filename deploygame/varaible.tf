variable "image_id" {
  default ="ami-0cff7528ff583bf9a"
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}

variable "instance_type" {
  default = "t2.micro"
  type        = string
  description = "The type of your instance ."
}


variable "tags" {
  default = {
    "Name" = "Emanalotaibi-terraform"
  }
}