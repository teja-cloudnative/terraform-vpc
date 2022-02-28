resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.ENV}-route-table"
  }
}

resource "aws_route" "route-to-default-vpc" {
  route_table_id            = aws_route_table.route-table.id
  destination_cidr_block    = var.DEFAULT_VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.peer-to-default-vpc.id
}