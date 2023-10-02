resource "random_string" "bucket_name" {
  length           = 16
  special          = false
}

output "random_bucket_name_result" {
  value       = random_string.bucket_name.result
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "${random_string.bucket_name.id} My bucket"
    Environment = "Dev"
  }
}
