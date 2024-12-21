output "sqs_queue_url" {
  description = "url of created sqs queue"
  value = aws_sqs_queue.terraform_queue.url
}

output "sqs-queue_arn" {
  description = "arn of created sqs queue"
  value = aws_sqs_queue.terraform_queue.arn
}