resource "aws_instance" "Ec2-instance" {

  ami = var.image_id
  instance_type = var.instance_type

  tags = var.tags
}