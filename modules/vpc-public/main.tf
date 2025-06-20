# Creating VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true  # Enables DNS for resources (important for EKS or EC2 name resolution

  tags = {
    Name = var.vpc_name
    Env  = var.env
  }
}

# Creating Internet Gateway and attach it to VPC 
resource "aws_internet_gateway" "eks_internet_gateway" { #Allows public traffic (internet access) into the VPC.
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Env  = var.env
  }
}

# Using data source to get all Availability Zones in region
data "aws_availability_zones" "available_zones" {}

# Creating Public Subnet AZ1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true  #Automatically assigns a public IP to EC2 instances launched in this subnet.

  tags = {
    Name = "Public Subnet AZ1"
    Env  = var.env
  }
}

# Creating Public Subnet AZ2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  =  aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet AZ2"
    Env  = var.env
  }
}

# Creating Route Table and add Public Route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_internet_gateway.id
  }

  tags = {
    Name = "Public Route Table"
    Env  = var.env
  }
}

# Associating Public Subnet in AZ1 to route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associating Public Subnet in AZ2 to route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}


# ✅ Minimum Components for a Basic VPC
# These are required in most setups:

# Component	Purpose
# VPC	The virtual network container.
# Subnets (public/private)	Divide the VPC into smaller IP ranges.
# Internet Gateway (IGW)	Enables internet access for public subnets.
# Route Tables	Define how traffic flows in/out of subnets.
# Route Table Associations	Associate subnets with route tables.
# NAT Gateway (optional)	Allow private subnets to access the internet (e.g., to download packages).
# Elastic IP (for NAT)	Needed if you're using NAT Gateway.


