module "app_sync_lambda" {
  source        = "registry.terraform.io/terraform-aws-modules/lambda/aws"
  version       = "2.34.0"
  function_name = "app-sync-lambda"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  source_path   = "${path.module}/resources/app-sync-lambda"
}