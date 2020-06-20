output "integration_hash" {
  # random uuid generated when something changes in aws_api_gateway_method/aws_api_gateway_integration/pathPath
  # should be passed to aws_api_gateway_deployment triggers
  value = random_uuid.hash.id
}
