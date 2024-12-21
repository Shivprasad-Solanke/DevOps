output "iam_user_name" {
  description = "The name of the IAM user"
  value       = aws_iam_user.user.name
}

output "iam_policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.policy.arn
}