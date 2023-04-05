provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "../network"
}

module "ec2-server" {
  source    = "../ec2"
  instance_type  = var.ec2_instance_type
  instance_name = var.ec2_name
  vpc-id    = module.network.vpc_id
  subnet-id = module.network.subnet_id
}