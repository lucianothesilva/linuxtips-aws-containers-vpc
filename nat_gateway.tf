resource "aws_eip" "vpc_eip_1a" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-1a", var.project_name)
  }

}

resource "aws_nat_gateway" "nat_1a" {
  allocation_id = aws_eip.vpc_eip_1a.vpc_id
  subnet_id     = aws_subnet.public_subnet_1a
  tags = {
    Name = format("%s-nat-1a", var.project_name)
  }
}


resource "aws_eip" "vpc_eip_1b" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-1b", var.project_name)
  }

}

resource "aws_nat_gateway" "nat_1b" {
  allocation_id = aws_eip.vpc_eip_1b.vpc_id
  subnet_id     = aws_subnet.public_subnet_1b
  tags = {
    Name = format("%s-nat-1b", var.project_name)
  }
}


resource "aws_eip" "vpc_eip_1c" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-1c", var.project_name)
  }

}

resource "aws_nat_gateway" "nat_1c" {
  allocation_id = aws_eip.vpc_eip_1c.vpc_id
  subnet_id     = aws_subnet.public_subnet_1c
  tags = {
    Name = format("%s-nat-1c", var.project_name)
  }
}