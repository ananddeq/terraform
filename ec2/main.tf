resource "aws_instance" "project-server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.access.id}"]
  subnet_id                   = var.subnet-id
  key_name                    = var.privatekey
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl
sudo apt-get update
sudo apt install awscli -y
sudo apt-get install -y docker.io
sudo docker run hello-world
  EOF
  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "access" {
  name   = "project-sg"
  vpc_id = var.vpc-id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "SG-for-EC2"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}