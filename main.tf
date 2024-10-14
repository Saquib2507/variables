terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.70.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "myserver" {
  ami = "ami-0845068028e672a07"
  instance_type = var.aws_instance_type
  root_block_device {
    delete_on_termination = true
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  tags = {
    Name = "SampleServer"
  }
}