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

variable "policy_arn" {
  default     = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  type        = string
  description = "policy arn"
}