output "bucket_name" {
  value = aws_s3_bucket.website_bukcet.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_website_endpoint.website_endpoint
}

output "cloudfront_distribution_name"{
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}