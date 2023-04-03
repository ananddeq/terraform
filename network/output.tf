output "vpc_id" {
  value = aws_vpc.project-vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet-1.id
}