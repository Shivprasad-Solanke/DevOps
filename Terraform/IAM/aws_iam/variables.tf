# variables for provider
variable "aws_region" {
  description = "region name"
  default = "ap-south-1"
}

# Variable for IAM user names
variable "iam_user_names" {
  description = "List of IAM user names"
  type        = list(string)
  default     = ["john", "jane", "bob"]
}

# Varaiblaes for IAM Group name
variable "iam_group_name" {
  description = "Name of IAM group"
  type = string
  default = "developers"
}

# Varaiblaes IAM policies name
variable "iam_user_policy_name" {
 description = "IAM policies name" 
 default = "NewPolicyUser"
}

# Variable for IAM role names
variable "iam_role_name" {
  description = "IAM role name"
  default = "NewRole"
}

# Varaiblaes IAM role policies name
variable "iam_role_policy_name" {
 description = "IAM role policies name" 
 default = "NewPolicyRole"
}


# Variable for Environment Tags
variable "environment" {
  description = "Environment tag for resources"
  type        = string
  default     = "Production"
}