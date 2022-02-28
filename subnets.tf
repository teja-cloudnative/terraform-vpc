resource "aws_subnet" "subnet" {
  count             = var.SUBNETS
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.VPC_CIDR, 1, count.index)
  availability_zone = element(var.AZ, count.index)
}
resource "aws_route_table_association" "rt-assoc" {
  count          = var.SUBNETS
  subnet_id      = element(aws_subnet.subnet.*.id, count.index )
  route_table_id = aws_route_table.route-table.id
}
