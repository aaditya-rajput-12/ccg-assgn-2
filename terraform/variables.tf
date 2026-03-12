variable "aws_region" {
  default = "ap-south-1"  
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "ami_id" {
  default = "ami-019715e0d74f695be"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "ansible-key-3"

}