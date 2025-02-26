# main.tf
provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "example" {
  name        = "sentinel"
  description = "Example security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sentinel-sg"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-027951e78de46a00e"
  instance_type = "t2.micro"

  tags = {
    Name = "sentinel-instance"
  }
}
