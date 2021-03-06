
variable "rest_api_id" {
  type        = string
  description = "API Gateway ID"
}

variable "resource_id" {
  type        = string
  description = "API Gateway resource this method belongs to"
}

variable "resource_path" {
  type        = string
  description = "API Gateway resource part path this method belongs to e.g /rootPath/partPath. Required to support aws_api_gateway_deployment triggers"
}

variable "http_method" {
  type = string
}

variable "validator_id" {
  type        = string
  description = "ID of request validator"
}

variable "api_key_required" {
  type    = bool
  default = false
}

variable "cors_allow_headers" {
  type        = list(string)
  description = "Comma separated list of allowed headers"
  default = [
    "Content-Type",
    "X-Amz-Date",
    "Authorization",
    "X-Api-Key",
    "X-Amz-Security-Token",
    "X-Token"
  ]
}

variable "cors_allow_methods" {
  type        = list(string)
  description = "Comma separated list of allowed methods"
  default = [
    "GET", "OPTIONS", "POST", "PUT", "PATCH", "DELETE"
  ]
}

# integration with Lambda function
variable "integration_http_method" {
  type    = string
  default = "POST"
}

variable "integration_type" {
  type    = string
  default = "AWS_PROXY"
}

variable "lambda_invoke_arn" {
  type        = string
  description = "Lambda function invoke ARN. MUST be INVOKE ARN, not just ARN"
}

variable "request_parameters" {
  type        = map(string)
  description = "aws_api_gateway_integration request parameters - configures parameters passed to integration e.g X-Amz-Invocation-Type heder automatically passed to lambda function"
  default     = {}
}

variable "mapping_templates" {
  type        = map(string)
  default     = null
  description = "Mapping templates"
}

variable "enable_async_lambda_integration" {
  type        = bool
  default     = false
  description = "Adds default 'aws_api_gateway_method_response' and 'aws_api_gateway_integration_response' to automatically respond with 202 after forwarding request to lambda. Requires 'integration_type' to be set to 'AWS'"
}

variable "async_response_status_code" {
  type        = string
  default     = "202"
  description = "Success response status code to use when async integration is enabled"
}

variable "request_model" {
  type        = map(string)
  default     = {}
  description = "Enables automatic request body validation, expects ('application/json' = aws_api_gateway_model.name)"
}

# authrorizer
variable "authorizer_id" {
  default = null
  type    = string
}

variable "authorization_scopes" {
  type    = list(string)
  default = null
}

variable "authorization_type" {
  type        = string
  default     = "NONE"
  description = "COGNITO_USER_POOLS or CUSTOM"
}
