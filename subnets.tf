resource "aws_subnet" "subnet" {
  count             = var.SUBNETS
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.VPC_CIDR, 1, count.index)
  availability_zone = element(var.AZ, count.index)
}
