variable "region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}


# Mover isso daqui, lista os CIDRS
variable "public_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.48.0/24", "10.0.49.0/24", "10.0.50.0/24"]
}

# Cria subnets usando o count assignando letras de forma dinamica
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = format("%s%s", var.region, ["a", "b", "c"][count.index])
  
  tags = {
    Name = format("%s-public-subnet-1%s", var.project_name, ["a", "b", "c"][count.index])
  }
}

resource "aws_route_table" "public_internet_access" {
  vpc_id = var.vpc_id
  
  tags = {
    Name = format("%s-public", var.project_name)
  }
}

resource "aws_route" "public_access" {
  route_table_id         = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Usa o count pra criar de forma dinamica as associações de subnets publicas com a route table
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_internet_access.id
}