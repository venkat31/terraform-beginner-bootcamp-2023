output "s3_staticwebsite_endpoint"{
  value = aws_s3_bucket_website_configuration.s3_website_endpoint.website_endpoint
}

output "domain_regional_name"{
  value = aws_s3_bucket.website_bukcet.bucket_regional_domain_name