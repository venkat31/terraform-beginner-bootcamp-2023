output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.terrahouse-aws.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  value = module.terrahouse-aws.website_endpoint
}

output "cdn-domainname"{
    value = module.terrahouse-aws.cloudfront_distribution_name
}