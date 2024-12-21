# Main Terraform Configuration for AWS IAM Resources

# ------------------------- IAM USERS -------------------------
# Define IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(var.iam_user_names)
  name     = each.key
  tags = {
    Environment = var.environment
  }
}

# ------------------------- IAM GROUPS -------------------------
# Define IAM Groups
resource "aws_iam_group" "developers" {
  name = var.iam_group_name
}

# Attach Users to Groups
resource "aws_iam_user_group_membership" "user_groups" {
  for_each = aws_iam_user.users
  user     = each.value.name
  groups   = [aws_iam_group.developers.name]
  depends_on = [aws_iam_group.developers]
}

# ------------------------- IAM POLICIES -------------------------
# Define a Custom Policy for user
resource "aws_iam_policy" "example_policy" {
  name        = var.iam_user_policy_name
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to user
resource "aws_iam_user_policy_attachment" "policy_attachment" {
  for_each = aws_iam_user.users
  user = each.value.name
  policy_arn = aws_iam_policy.example_policy.arn
}
# ------------------------- IAM ROLES -------------------------
# Define IAM Roles
resource "aws_iam_role" "example_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Define custom policy for role
resource "aws_iam_policy" "s3_access_policy" {
  name   = var.iam_role_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
         Action   = "s3:*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  role       = aws_iam_role.example_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}