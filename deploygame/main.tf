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
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["37.42.131.55/32"]
  }


  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }