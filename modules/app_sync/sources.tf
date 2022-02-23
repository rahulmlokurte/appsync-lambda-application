data "template_file" "movies_request_template" {
  template = file("${path.module}/templates/movies_request_template.json")
}

data "template_file" "movies_response_template" {
  template = file("${path.module}/templates/movies_response_template.json")
}

data "template_file" "getMovie_request_template" {
  template = file("${path.module}/templates/getMovie_request_template.json")
}

data "template_file" "getMovie_response_template" {
  template = file("${path.module}/templates/getMovie_response_template.json")
}