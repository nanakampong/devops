terraform { 
  backend "s3" {
    bucket = "nanaassignment"
    key    = "nanaassignment/dev/nana/terraformstate"
    region = "us-east-1"
  }
} 