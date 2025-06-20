variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "ap-south-1"  # You can change this to your preferred region
}
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
