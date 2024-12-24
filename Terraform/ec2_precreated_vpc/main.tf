data "aws_vpc" "selected" {
  id = var.vpc_id
  tags = {
    need = "ec2-exisisting-vpc"
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "ec2example" {
  ami = data.aws_ami.amzn-linux-2023-ami.id
  subnet_id = data.aws_subnet.selected.id
  instance_type = var.instance_type
}