output "aws_ecr_repository_arn" {
value = aws_ecr_repository.foo.arn
}

output "aws_ecr_repository_url" {
  value = aws_ecr_repository.foo.repository_url
}