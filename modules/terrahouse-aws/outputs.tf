output "random_bucket_name_result" {
  value = aws_s3_bucket.website_bukcet.bucket
}

output "s3_staticwebsite_endpoint"{
  value = aws_s3_bucket_website_configuration.s3_website_endpoint.website_endpoint
}