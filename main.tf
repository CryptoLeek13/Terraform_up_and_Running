provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraformUP" {
  ami                    = "ami-02d1e544b84bf7502"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.terraformUPSG.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-book-example1"
  }
}
resource "aws_security_group" "terraformUPSG" {
  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}