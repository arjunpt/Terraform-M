variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "env" {
  description = "Environment tag (e.g., dev, prod)"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "CIDR block for Public Subnet in Availability Zone 1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for Public Subnet in Availability Zone 2"
  type        = string
}
