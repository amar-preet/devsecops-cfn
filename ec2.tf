provider "aws" {
  region = var.region
  profile = "default"
}

resource "aws_instance" "example" {
  ami                    = "ami-09c5e030f74651050"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = "or"

  user_data = <<EOF
#!/bin/bash
echo "Hello, World!" > index.html
nohup busybox httpd -f -p 8080 &
EOF
}

resource "aws_security_group" "instance" {
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "instance_key" {
  value = aws_instance.example.key_name
}

output "instance_id" {
  value = aws_instance.example.id
}