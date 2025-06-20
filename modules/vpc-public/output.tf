output "vpc_id" { #
  description = "ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.my_vpc.cidr_block
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.eks_internet_gateway.id
}

output "public_subnet_az1_id" {
  description = "ID of the public subnet in AZ1"
  value       = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  description = "ID of the public subnet in AZ2"
  value       = aws_subnet.public_subnet_az2.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

output "availability_zones" {
  description = "List of availability zones used"
  value       = [aws_subnet.public_subnet_az1.availability_zone, aws_subnet.public_subnet_az2.availability_zone]
}