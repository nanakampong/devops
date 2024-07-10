terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }

  backend "s3" {
    bucket = "nanaassignment"
    key    = "nanaassignment/dev/nana/terraformstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = var.region
}

provider "aws" {
  alias = "west"
  region = var.region1
}


resource "aws_iam_user" "iam_user" {
  name = var.iam_user

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
  provider = aws.west
  instance_type = var.instance_type
  tags = {
    Name = var.tag1
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

