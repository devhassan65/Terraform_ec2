environment = "dev"
ami = "ami-0354c98ae10b02961"
instance_type = "t2.micro"
instance_count = 1
ec2_username = "ubuntu"
key_name = "Terraform-dev-userdata"
ec2_sg = "allow_ssh_dev"
ssh_port = 22
tags = {
  "Name" = "Terraform-EC2"
  "Environment" = "dev"
    }
volume_size = "15"
volume_type = "gp3"
user_data = "file ('')"