# here is one of vpc 
resource "aws_vpc" "MyVpc" {
  cidr_block = var.cidr_block
}

# ----- 1 gatway here ------

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.MyVpc.id
}

# ----- 2 Route table one public  ------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.MyVpc.id
}

# ----- assosocated  one public  ------

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# ----- 2 Route table one praivate  ------

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.default.id
}

# ----- assosocated  one  Praivate  ------

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
  
}

# -------- this is route ----------

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}


resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
}


# ----------------- subnet --------------
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
}


# ----------------- security groups --------------


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

