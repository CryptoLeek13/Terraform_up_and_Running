provider "aws" {
  region = "us-east-2"
}
// Create a port Var
variable "server_port" {
  description = "The port the server will be listening on"
  type        = number
  default     = 8080
}
// Create ec2 instance with custom vpc and user data
resource "aws_instance" "terraformUP" {
  ami                    = "ami-02d1e544b84bf7502"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.terraformUPSG.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "terraform-book-example1"
  }
}
resource "aws_security_group" "terraformUPSG" {
  ingress {
    from_port   = var.server_port
    protocol    = "tcp"
    to_port     = var.server_port
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ip" {
  value       = aws_instance.terraformUP.public_ip
  description = "The public ip address for the aws instance"
}