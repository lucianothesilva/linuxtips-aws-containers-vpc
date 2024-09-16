variable "region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
}

# Cria subnets privadas usando o count assignando letras de forma dinamica
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = format("%s%s", var.region, ["a", "b", "c"][count.index])
  
  tags = {
    Name = format("%s-priv-subnet-1%s", var.project_name, ["a", "b", "c"][count.index])
  }

}

# Cria private route tables para cada subnet
resource "aws_route_table" "private_internet_access" {
  count  = length(var.private_subnet_cidr_blocks)
  vpc_id = var.vpc_id
  
  tags = {
    Name = format("%s-private-1%s", var.project_name, ["a", "b", "c"][count.index])
  }
}


resource "aws_route" "private_access" {
  count                  = length(aws_route_table.private_internet_access)
  route_table_id         = aws_route_table.private_internet_access[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}

# Associa as private subnets com suas respectivas route tables
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_internet_access[count.index].id

}
