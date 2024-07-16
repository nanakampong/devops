resource "aws_iam_user" "iam_user" {
  name = var.iam_user

}

resource "aws_iam_policy" "policy1" {
  name   = var.policy1
  path   = "/"
  policy = data.aws_iam_policy_document.terra.json
}




resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.policy1.arn
}

resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.iam_user.name
  policy_arn = var.policy_arn
}


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


