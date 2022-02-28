resource "aws_subnet" "public-subnets" {
  count             = var.PUBLIC_SUBNETS
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.VPC_CIDR, 3, count.index)
  availability_zone = element(var.AZ, count.index)
}

resource "aws_subnet" "private-subnets" {
  count             = var.PRIVATE_SUBNETS
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.VPC_CIDR, 3, count.index+2)
  availability_zone = element(var.AZ, count.index)
}

resource "aws_route_table_association" "rt-assoc" {
  count          = var.SUBNETS
  subnet_id      = element(aws_subnet.subnet.*.id, count.index )
  route_table_id = aws_route_table.route-table.id
}
