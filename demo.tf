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

#Create a subnet
resource "aws_subnet" "demo_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2b"
  #map_public_ip_on_launch = true
  tags = {
    Name = "demo-subnet"
  }
}


resource "aws_instance" "demo-ec2"{
  ami = "ami-097a2df4ac947655f"
  instance_type = "t3.small"
  key_name = var.ec2_ssh_key_name
  availability_zone = "us-east-2b"
  subnet_id = aws_subnet.demo_subnet.id
  tags = {
    Name = "demo-ec2"
  }
}





