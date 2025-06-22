variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "ap-south-1"  # You can change this to your preferred regions
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

####

# Stack name
variable "cluster_name" {
  type        = string
  description = "Project Name"
}
variable "instance_type" {
  type        = string
  description = "Type"
}

# Security Group 
variable "eks_security_group_id" {
  type        = string
  description = "ID of EKS worker node's security group"
}

# Master ARN
variable "master_arn" {
  type        = string
  description = "ARN of master node"
}

# Worker ARN
variable "worker_arn" {
  type        = string
  description = "ARN of worker node"
}

# Worker Node & Kubectl instance size
variable "instance_size" {
  type        = string
  description = "Worker node's instance size"
}

# node count
variable "worker_node_count" {
  type        = string
  description = "Worker node's count"
}

# AMI ID
variable "image_id" {
  type        = string
  description = "AMI ID"
}

# Cluster Version
variable "cluster_version" {
  type        = string
  description = "Cluster Version"
}

# VPC CNI Version
variable "vpc-cni-version" {
  type        = string
  description = "VPC CNI Version"
}

# Kube Proxy Version
variable "kube-proxy-version" {
  type        = string
  description = "Kube Proxy Version"
}
# Instance count
variable "instance_count" {
  type = string
}
# AMI ID
variable "ami_id" {
  type = string
}

