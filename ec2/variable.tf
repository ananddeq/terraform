variable "privatekey" {
  default = "doc"
  type = string
}

variable "instance_type" {
  default = "t2.medium"
  type = string
}

variable "ami_id" {
  default = "ami-0557a15b87f6559cf"
}