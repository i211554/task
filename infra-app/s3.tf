resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.env}-${var.bucketName}"

  tags={
    Name="${var.env}-${var.bucketName}"
    Environment=var.env
  }
}
###