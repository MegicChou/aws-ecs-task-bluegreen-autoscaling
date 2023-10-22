# ======================
# AWS ECS 服務設定
# ======================
resource "aws_ecs_service" "main_service" {
  cluster          = var.aws_ecs_cluster_id
  name             = var.aws_ecs_service_name
  task_definition  = aws_ecs_task_definition.web-task.arn
  launch_type      = "FARGATE"
  platform_version = "1.4.0"
  desired_count    = var.aws_ecs_desired_count

  # ===========================
  # ELB HealthCheck 忽略時間 (單位：秒)
  # ===========================
  health_check_grace_period_seconds = var.aws_ecs_health_check_grace_period_seconds

  # ===========================
  # AWS ECS 網路設定
  # ===========================
  network_configuration {
    security_groups  = var.aws_security_group_ids
    subnets          = var.aws_ecs_service_subnet_list
    assign_public_ip = true
  }

  # ===========================
  # 部屬控制 (由 CodeDeploy 進行)
  # ===========================
  deployment_controller {
    type = "CODE_DEPLOY"
  }

  # ===========================
  # Load Balancer 設定
  # ===========================
  load_balancer {
    target_group_arn = var.aws_target_group_arn
    container_name   = var.task_container_name
    container_port   = var.task_container_port
  }

  # ===========================
  # 忽略以下設定值異動
  # ===========================
  lifecycle {
    ignore_changes = [desired_count, task_definition, load_balancer]
  }
}