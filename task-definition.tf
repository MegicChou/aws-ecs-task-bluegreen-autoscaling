data "template_file" "container_definitions" {
  template = file("${path.module}/template/task-definitions/container-definitions.json")
  vars = {
    image               = aws_ecr_repository.web_repository.repository_url
    desired_task_cpu    = var.aws_ecs_task_definition_cpu
    desired_task_memory = var.aws_ecs_task_definition_memory
    log_group           = aws_cloudwatch_log_group.service-log-group.name
    container_port      = var.task_container_port
    container_name      = var.task_container_name
    aws_region          = var.aws_region
  }
}

# ====================
# ECS 任務定義
# ====================
resource "aws_ecs_task_definition" "web-task" {
  family                   = "${var.aws_ecs_service_name}-task"
  container_definitions    = data.template_file.container_definitions.rendered
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.aws_ecs_task_definition_cpu
  memory                   = var.aws_ecs_task_definition_memory

  execution_role_arn = aws_iam_role.ecs_execute_role.arn
  task_role_arn      = aws_iam_role.task_role.arn
}

