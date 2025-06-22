module "vpc" { #
  source                 = "../modules/vpc-public"
  vpc_name               = var.vpc_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az2_cidr = var.public_subnet_az2_cidr
  env                    = var.env

}
# Creating EKS Cluster
module "eks" {
  source                = "../modules/eks"
  master_arn            = module.iam.master_arn
  instance_type         = var.instance_type
  worker_arn            = module.iam.worker_arn
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  env                   = var.env
  eks_security_group_id = module.security_groups.eks_security_group_id
  instance_size         = var.instance_size
  cluster_name          = var.cluster_name
  worker_node_count     = var.instance_count
  image_id              = var.ami_id
  cluster_version       = var.cluster_version
  vpc-cni-version       = var.vpc-cni-version
  kube-proxy-version    = var.kube-proxy-version
}

# Creating security group
module "security_groups" {
  source       = "../modules/eks-security-group"
  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  env          = var.env
}

# Creating IAM resources
module "iam" {
  source = "../modules/eks-iam-role"
}
