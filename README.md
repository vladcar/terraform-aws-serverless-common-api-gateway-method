# AWS API Gateway method

Use this module to attach HTTP method to `aws_api_gateway_resource`.
Designed to be used for Lambda function integrations, currently supports both Lambda PROXY and async invocation mode.

### Example usage

#### Lambda Proxy

```hcl-terraform

resource "aws_api_gateway_rest_api" "api" {
  name = "my-api"
}

resource "aws_api_gateway_resource" "root_resource" {
  path_part   = "path"
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.api.id
}

module "proxy_get_endpoint" {
  source            = "vladcar/serverless-common-api_gateway_method/aws"
  http_method       = "GET"
  resource_path     = aws_api_gateway_resource.root_resource.path_part
  resource_id       = aws_api_gateway_resource.root_resource.id
  rest_api_id       = aws_api_gateway_rest_api.api.id
  validator_id      = aws_api_gateway_request_validator.validator.id
  lambda_invoke_arn = var.you_lambda_invoke_arn
}

```

See variables for more customization.

#### Async invocation

```hcl-terraform

module "async_post_endpoint" {
  source                          = "vladcar/serverless-common-api_gateway_method/aws"
  http_method                     = "POST"
  integration_type                = "AWS"
  integration_http_method         = "POST"
  async_response_status_code      = "202"
  resource_path                   = aws_api_gateway_resource.prospect_resource.path_part
  resource_id                     = aws_api_gateway_resource.prospect_resource.id
  rest_api_id                     = aws_api_gateway_rest_api.api.id
  validator_id                    = aws_api_gateway_request_validator.validator.id
  lambda_invoke_arn               = var.you_lambda_invoke_arn
  enable_async_lambda_integration = true
}

```