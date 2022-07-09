provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraformUP" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-book-example1"
  }
}
