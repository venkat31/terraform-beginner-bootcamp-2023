resource "aws_s3_bucket" "website_bukcet" {
  bucket = var.bucket_name

  tags = {
    UserUuid    = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "s3_website_endpoint" {
  bucket = aws_s3_bucket.website_bukcet.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html_file" {
  bucket = aws_s3_bucket.website_bukcet.bucket
  key    = "index.html"
  #source = "${path.root}/public/index.html"
  source = var.index_html_path

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(var.index_html_path)
}

resource "aws_s3_object" "error_html_file" {
  bucket = aws_s3_bucket.website_bukcet.bucket
  key    = "error.html"
  #source = "${path.root}/public/index.html"
  source = var.error_html_path

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(var.error_html_path)
}