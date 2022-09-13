variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}
variable "instance_type" {
  type        = string
  description = "The type of your instance ."
}
variable "tags" {
  type = map(any)
  default = {
    "name" = "ec2-terraform"
  }
}





