terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
# Create a EC2
resource "aws_instance" "web" {
  ami           = "ami-03fa4afc89e4a8a09" # ap-south-1
  instance_type = "t2.micro"
  count = 2
  tags = {
      Name = "web.${count.index}"
  }
}
output "ec2"{
  value = "aws_instance.web"
}
