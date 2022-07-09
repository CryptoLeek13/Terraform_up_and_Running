provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraformUP" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-book-example1"
  }
}
