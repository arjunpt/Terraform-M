module "vpc" {
  source                 = "../modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az2_cidr = var.public_subnet_az2_cidr
  env                    = var.env

}
