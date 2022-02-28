resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.ENV}-route-table"
  }
}


