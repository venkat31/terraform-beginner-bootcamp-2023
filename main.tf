module "terrahouse-aws"{
  source = "./modules/terrahouse-aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}