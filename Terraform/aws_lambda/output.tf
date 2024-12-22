output "aws_lambda_function_name" {
  value = aws_lambda_function.lambda_function_name.function_name
}

output "aws_lambda_function_arn" {
  value = aws_lambda_function.lambda_function_name.arn
}

output "aws_role_for_lambda_name" {
  value = aws_iam_role.iam_for_lambda.name
}

output "aws_role_for_lambda_arn" {
  value = aws_iam_role.iam_for_lambda.arn
}

output "aws_lambda_function_handler" {
  value = aws_lambda_function.lambda_function_name.handler
}

output "aws_lambda_function_filename" {
  value = aws_lambda_function.lambda_function_name.filename
}