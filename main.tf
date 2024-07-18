module "user" {
source = "./iam"
iam_user = var.iam_user
policy1 = "kojopolicy1"
}

module "server" {
source = "./ec2"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
  }