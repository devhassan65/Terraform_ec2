# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# Step 1 — Create SSH Key Pair
resource "aws_key_pair" "default" {
  key_name   = "terraform-key-first"
  public_key = file("/home/codespace/.ssh/id_rsa.pub")
}

# Step 2 — Create Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "terraform_allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-ec2-sg"
  }
}

# Step 3 — Create EC2 Instance
resource "aws_instance" "ec2" {
  ami                    = "ami-081b0a6eac00b4f53"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.default.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id = "subnet-005d4953d9734f867"

  tags = {
    Name = "Terraform-EC2"
  }
}

# Step 4 — Outputs
output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "key_name" {
  value = aws_key_pair.default.key_name
}

output "public_dns" {
  value = aws_instance.ec2.public_dns
}
