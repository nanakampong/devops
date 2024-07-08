terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "west"
  region = "us-west-1"
}


resource "aws_iam_user" "iam_user" {
  name = "bob"

}

data "aws_iam_policy_document" "terra" {
  statement {
    sid = "bobpolicy"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:DescribeJob"
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }


}

resource "aws_iam_policy" "policy1" {
  name   = "bobpolicy1"
  path   = "/"
  policy = data.aws_iam_policy_document.terra.json
}




resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.policy1.arn
}

resource "aws_iam_user_policy_attachment" "test-attach2" {
  user       = aws_iam_user.iam_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
 } 


 resource "aws_instance" "web" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  tags = {
    Name = "bobweb"
   }
  } 

  resource "aws_instance" "web2" {
  ami           = "ami-0ff591da048329e00"
  provider = aws.west
  instance_type = "t2.micro"
  tags = {
    Name = "bobweb2"
   }
  } 

  output "ec2east1" {
  value = aws_instance.web.private_ip
}

  output "ec2west1" {
  value = aws_instance.web2.private_ip
}

 output "user_id" {
  value = aws_iam_user.iam_user
}

