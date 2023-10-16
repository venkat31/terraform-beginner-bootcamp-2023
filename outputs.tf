output "bucket_name"{
    value = module.terrahouse-aws.random_bucket_name_result
}

output "website_endpoint"{
    value = module.terrahouse-aws.s3_staticwebsite_endpoint
}