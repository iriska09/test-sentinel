# provider "aws" {
#   region = "us-west-2"
# }

# resource "aws_security_group" "example" {
#   name        = "sentinel"
#   description = "Example security group"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "sentinel-sg"
#   }
# }

# resource "aws_instance" "example" {
#   ami           = "ami-027951e78de46a00e"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "sentinel-instance"
#   }
# }
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-027951e78de46a00e" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "sentinel-demo-instance"
  }
}

resource "aws_security_group" "example" {
  name_prefix = "sentinel-demo-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}