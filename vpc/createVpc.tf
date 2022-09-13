
resource "aws_vpc" "MyVpc" {
  cidr_block = var.cidr_block
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.MyVpc.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.MyVpc.id
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}


resource "aws_subnet" "public" {
  vpc_id      = aws_vpc.MyVpc.id
  cidr_block  = var.public_subnet_cidr_blocks
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "security_group" {
    vpc_id = aws_vpc.MyVpc.id
     ingress {
    description      = "SecGroup from VPC"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
}
  }




 


