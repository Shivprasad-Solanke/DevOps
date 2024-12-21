variable "aws_region" {
  description = "AWS region to use for resources"
  default     = "ap-south-1"
}

variable "iam_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "terraform-user"
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "terraform-policy"
}