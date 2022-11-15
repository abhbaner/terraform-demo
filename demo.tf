# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key_id
  #access_key = "XXXXXXXX"
  secret_key = var.aws_secret_key_id
  #secret_key = "XXXXXXXXX"
}

# Create a VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_instance" "demo-ec2"{
  ami = "ami-0fc231e7d7af4036b"
  instance_type = "t3.small"
  key_name = var.ec2_ssh_key_name
  availability_zone = "us-west-2b"
  tags = {
    Name = "demo-ec2"
  }
}





