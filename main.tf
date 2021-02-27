provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-09c5e030f74651050"
  instance_type = "t2.micro"
}

resource "aws_eip" "ubuntu" {
  vpc      = true
  instance = aws_instance.ubuntu.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Enable SSH access via port 22"

  ingress {
    description = "TLS from VPC"
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
