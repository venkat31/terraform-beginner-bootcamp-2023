resource "aws_s3_bucket" "website_bukcet" {
  bucket = var.bucket_name

  tags = {
    UserUuid    = var.user_uuid
  }
}
