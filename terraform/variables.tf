variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "ap_south-1"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}   

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ec2_instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t3.micro"
  
}

variable "ec2_key_pair" {
    description = "Name of the EC2 key pair to use for SSH access"
    type        = string
    default     = "ansible-key-3"
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
    default     = "ami-0c55b159cbfafe1f0"

}

