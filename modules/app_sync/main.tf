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
      data_source       = "movie_app_sync_datasource"
      direct_lambda     = true
      request_template  = data.template_file.getMovie_request_template.rendered
      response_template = data.template_file.getMovie_response_template.rendered
    }

    "Query.movies" = {
      data_source       = "movie_app_sync_datasource"
      direct_lambda     = true
      request_template  = data.template_file.movies_request_template.rendered
      response_template = data.template_file.movies_response_template.rendered
    }
  }
}