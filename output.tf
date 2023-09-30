# =============================
# ECR Repository Url
# =============================

output "ecr_repository_url" {
  value = aws_ecr_repository.web_repository.repository_url
}

# =============================
# ECS Service CloudWatch Log
# =============================

output "ecs_service_cloudwatch_log_name" {
  value = aws_cloudwatch_log_group.service-log-group.name
}

# =============================
# 角色執行權限 - Amazon ECS 容器代理程式
# =============================

output "ecs_iam_execute_role_arn" {
  value = aws_iam_role.task_role.arn
}

# =============================
# 角色執行權限 - Amazon ECS 容器角色執行權限
# =============================

output "ecs_iam_task_execute_role_arn" {
  value = aws_iam_role.ecs_execute_role.arn
}

# =============================
# 角色執行權限 - Amazon ECS 容器 API 許可 （允許 AP 可以呼叫的API）
# ============================

output "ecs_iam_task_role_arn" {
  value = aws_iam_role.task_role.arn
}

# =============================
# AWS Service Name
# =============================

output "ecs_service_name" {
  value = aws_ecs_service.main_service.name
}


# =============================
# AWS Task Definition
# =============================

output "ecs_task_definition_family" {
  value = aws_ecs_task_definition.web-task.family
}

# =============================
# AWS Cloudwatch Log
# =============================

output "ecs_cloudwatch_log_name" {
  value = aws_cloudwatch_log_group.service-log-group.name
}