variable "region" {
  default     = "us-east-1"
  type        = string
  description = "this is the default region"
}

variable "region1" {
  default     = "us-west-1"
  type        = string
  description = "this is the backup region"
}

variable "iam_user" {
  default     = "bob"
  type        = string
  description = "iam user"
}

variable "policy1" {
  default     = "bobpolicy1"
  type        = string
  description = "iam user policy"
}

variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "ami2" {
  default = "ami-0ff591da048329e00"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tag" {
  default = "bobweb"
}

variable "tag1" {
  default = "bobweb2"
}

variable "policy_arn" {
  default     = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  type        = string
  description = "policy arn"
}