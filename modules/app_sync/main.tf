module "movie_app_sync" {
  source = "registry.terraform.io/terraform-aws-modules/appsync/aws"
  version = "1.4.0"
  name = "movie_app_sync"
  schema = file("${path.module}/resources/movie_app_sync_schema.graphql")
  api_keys = {default = null}
  datasources = {
    "movie_app_sync_datasource" = {
      type = "AWS_LAMBDA"
      lambda_config = {
        function_arn = var.function_arn
      }
    }
  }
}