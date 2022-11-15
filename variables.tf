variable "aws_access_key_id" {
    sensitive = true
}

variable "aws_secret_key_id" {
   sensitive = true
}  

variable "ec2_ssh_key_name" {
    description = "The SSH key par in the region the instance will be launched"
}

variable "aws_region" {
    default = "us-east-2"
}