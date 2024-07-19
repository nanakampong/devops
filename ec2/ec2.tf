
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.tag
  }
}

resource "aws_instance" "web2" {
  ami           = var.ami2
  provider      = aws.west
  instance_type = var.instance_type
  tags = {
    Name = var.tag1
  }
}
