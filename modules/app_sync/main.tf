module "movie_app_sync" {
  source      = "registry.terraform.io/terraform-aws-modules/appsync/aws"
  version     = "1.4.0"
  name        = "movie_app_sync"
  schema      = file("${path.module}/resources/movie_app_sync_schema.graphql")
  api_keys    = { default = null }
  datasources = {
    "movie_app_sync_datasource" = {
      type         = "AWS_LAMBDA"
      function_arn = var.app_sync_function_arn
    }
  }
  resolvers = {
    "Query.getMovie" = {
      data_source = "movie_app_sync_datasource"
      direct_lambda = true
      request_template = <<EOF
      {
    "version": "2017-02-28",
    "operation": "Invoke",
    "payload": {
        "field": "getMovie",
        "arguments":  $utils.toJson($context.arguments)
    }
}
EOF
      response_template = <<EOF
      $utils.toJson($context.result)
EOF
    }
  }

  direct_lambda_request_template = ""
}