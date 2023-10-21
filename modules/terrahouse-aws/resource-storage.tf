resource "aws_s3_bucket" "website_bukcet" {
  bucket = var.bucket_name

  tags = {
    UserUuid    = var.user_uuid
  }
}

# locals {
#   s3_origin_id = "myS3Origin"
# }
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
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
  content_type = "text/html"
}

resource "aws_s3_object" "error_html_file" {
  bucket = aws_s3_bucket.website_bukcet.bucket
  key    = "error.html"
  #source = "${path.root}/public/index.html"
  source = var.error_html_path
  content_type = "text/html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(var.error_html_path)
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = var.bucket_name  # Replace with your actual bucket name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipalReadOnly",
        Effect    = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.website_bukcet.id}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
          }
        }
      }
    ]
  })
}

resource "terraform_data" "content_version" {
  input = var.content_version
}