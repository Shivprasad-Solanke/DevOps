variable "aws_region" {
  description = "region for aws provider"
  type = string
  default = "ap-south-1"
}

variable "sqs_queue_name" {
  description = "name of the queue"
  type = string
  default = "new_queue"
}

variable "delay_seconds" {
  description = "delay in seconds"
  type = number
  default = 60
}

variable "max_message_size" {
  description = "maximum message size"
  type = number
  default = "1024"
}

variable "message_retention_seconds" { 
    description = "message retention in seconds"
    type = number
    default = 65
}

variable "receive_wait_time_seconds" {
  description = "receive wait time in seconds"
  type = number
  default = "0"
}