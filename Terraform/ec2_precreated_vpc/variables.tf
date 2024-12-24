variable "aws_region" {
 description = "name of region used"
 default = "ap-south-1"
}

variable "vpc_id" {
    description = "id of the existing vpc"
    default = "vpc-0eea18c9aca4d5b74"
}

variable "subnet_id" {
    description = "id of the existing subnet"
    default = "subnet-0938d4603e712b0f4"
}

variable "availability_zone" {
  description = "availability zone from region"
  default = "ap-south-1a"
}

variable "instance_type" {
  description = "type of ec2 instance"
  default = "t2.micro"
}