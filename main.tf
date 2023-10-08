resource "aws_s3_bucket" "my-bucket" {
  bucket_name = var.bucket_name

  tags = {
    UserUuid    = var.user_uuid
  }
}
