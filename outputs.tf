output "VPC_ID" {
  value = aws_vpc.main.id
}

output "VPC_CIDR" {
  value = aws_vpc.main.cidr_block
}

output "SUBNETS_ID" {
  value = aws_subnet.subnet.*.id
}

output "SUBNETS_CIDR" {
  value = aws_subnet.subnet.*.cidr_block
}