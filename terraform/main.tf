terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "ap-south-1"

}

#VPC
resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support   = true
    tags = {
        Name = "main_vpc"
    }
}

#Public Subnet
resource "aws_subnet" "public_subnet" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = var.public_subnet_cidr
    availability_zone = "${var.aws_region}a"
    tags = {
        Name = "public_subnet"
    }
}

#security group
resource "aws_security_group" "web_sg" {
    name        = "web_sg"
    description = "Allow HTTP and SSH traffic"
    vpc_id      = aws_vpc.main_vpc.id



    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "Custom App Port"
        from_port   = 3000
        to_port     = 3000
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
        Name = "web_sg"
    }
}
#ec2 instance

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.web_sg.name]


    tags = {
        Name = "web-server"
    }
}
