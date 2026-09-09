# Step 3 — Create multiple EC2 Instances with their username using count and ec2_username
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}


variable "ec2_username" {
  description = "Default SSH username for EC2 instance"
  type        = string
  default     = "ec2-user"   # change to 'ubuntu' if needed
}

variable "key_name" {
  type = string
  default = "Terraform-prod-first"
}

variable "ec2_sg" {
  type = string
  default = "allow_ssh_prod"
  description = "security group name"
}

variable "ssh_port" {
type = number
default = 22
  
}

variable "ami" {
  type = string
  default = "ami-081b0a6eac00b4f53"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "tags" {
   type = map(string)
   default = {
     "Name" = "Terraform-EC2"
      Environment = "dev"
   }
}

variable "volume_size" {
  type = number
  default = 10
}

variable "volume_type" {
  type = string
  default = "gp3"
}