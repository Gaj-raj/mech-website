resource "aws_instance" "web-app" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"

  tags = {
    Name = "test-instance"
  }
}
