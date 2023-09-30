resource "aws_cloudwatch_log_group" "service-log-group" {
  name              = "ecs/service/${var.aws_ecs_service_cloudwatch_log_prefix_name}-log"
  retention_in_days = 30
}