# File: output.tf

# Output the ARNs of the IAM users
output "iam_user_arns" {
  value = [for user in aws_iam_user.users : user.arn]
}

# Output the ARN of the IAM group
output "iam_group_arn" {
  value = aws_iam_group.developers.arn
}

# Output the ARNs of the IAM policies
output "iam_policy_arns" {
  value = {
    user_policy_arn = aws_iam_policy.example_policy.arn
    role_policy_arn  = aws_iam_policy.s3_access_policy.arn
  }
}

# Output the ARN of the IAM role
output "iam_role_arn" {
  value = aws_iam_role.example_role.arn
}

# Output the list of all ARNs
output "all_arns" {
  value = concat(
    [for user in aws_iam_user.users : user.arn],
    [aws_iam_group.developers.arn],
    [aws_iam_policy.example_policy.arn, aws_iam_policy.s3_access_policy.arn],
    [aws_iam_role.example_role.arn]
  )
}