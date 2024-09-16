variable "project_name" {
  type = string
}

variable "availability_zones" {
  type    = list(string)
  default = ["a", "b", "c"]
}

variable "public_subnet_ids" {
  type = list(string)
}


resource "aws_eip" "nat_eip" {
  count  = length(var.availability_zones)
  domain = "vpc"
  
  tags = {
    Name = format("%s-eip-1%s", var.project_name, var.availability_zones[count.index])
  }
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]
  
  tags = {
    Name = format("%s-nat-1%s", var.project_name, var.availability_zones[count.index])
  }

}


output "nat_gateway_ids" {
  value = aws_nat_gateway.nat[*].id
  description = "List of NAT Gateway IDs"
}