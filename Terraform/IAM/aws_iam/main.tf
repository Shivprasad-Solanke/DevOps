resource "aws_iam_user" "user" {
  name = var.iam_user_name
}

resource "aws_iam_policy" "policy" {
  name        = var.iam_policy_name
  description = "An example policy to list S3 buckets"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:ListAllMyBuckets"
        Resource = "*" # Allow this action globally
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}
