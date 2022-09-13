# 1. Deploy two EC2 Instances with the names "Sample" and "Test"

# resource "aws_instance" "Ec2-instance" {

#   for_each = toset(["Sample","Test"])
  
#   ami = var.image_id

#   instance_type = var.instance_type

#   tags = {
#     Name = "${each.key}"
#   }
# }


# resource "aws_instance" "ubuntu" {

#     ami = var.image_ubntu
#     instance_type = var.instance_type
#     vpc_security_group_ids = [aws_security_group.securitygroup.id]
    

#     tags = var.tags
  
# }

# Create a two EC2 Amazon linux AMI ubuntu AMI.
#  Give public port 80 access and own IP for port 22.

#Create a amazon linux server 
resource "aws_instance" "linux" {

    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.securitygroup.id]
    associate_public_ip_address = true
    user_data = file("install.sh")
    tags = var.tags
  
}


resource "aws_security_group" "securitygroup" {
  

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["37.42.131.55/32"]
  }


  egress{
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  }