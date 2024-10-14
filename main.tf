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
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
  }

  tags = merge(var.additional_tags,{
    Name = "SampleServer"
  })
}