variable "privatekey" {
  default = "project"
  type = string
}

variable "instance_type" {
  default = "t2.medium"
  type = string
}

variable "ami_id" {
  default = "ami-0557a15b87f6559cf"
}

variable "subnet-id" {
  type = string
  description = "subent for ec2"
}

variable "vpc-id" {
  type = string
  description = "vpc for ec2 instance"
}