variable "env" {
    description = "The environment for the infrastructure"
    type        = string
}
variable "bucketName" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
}
variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
}
variable "aws_ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
}
variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
}
