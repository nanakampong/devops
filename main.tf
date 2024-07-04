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




resource "aws_iam_user" "devops" {
  name = "nana.a"


}



