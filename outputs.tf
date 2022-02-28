output "VPC_ID" {
  value = aws_vpc.main.id
}

output "VPC_CIDR" {
  value = aws_vpc.main.cidr_block
}

output "PUBLIC_SUBNETS_ID" {
  value = aws_subnet.public-subnets.*.id
}

output "PUBLIC_SUBNETS_CIDR" {
  value = aws_subnet.public-subnets.*.cidr_block
}

output "PRIVATE_SUBNETS_ID" {
  value = aws_subnet.private-subnets.*.id
}

output "PRIVATE_SUBNETS_CIDR" {
  value = aws_subnet.private-subnets.*.cidr_block
}