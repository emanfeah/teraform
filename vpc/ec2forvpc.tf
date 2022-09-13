resource "aws_instance" "Ec2-instance" {

  ami = "ami-0022f774911c1d690"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.security_group.id]
  depends_on = [aws_route.public, aws_route_table_association.public]
}