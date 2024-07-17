provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "west"
  region = var.region1
}
