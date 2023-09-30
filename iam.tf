locals {
  task_execute_role_filepath        = var.aws_iam_ecs_task_execute_filepath != "" ? var.aws_iam_ecs_task_execute_filepath : "${path.module}/policies/ecs-task-execution-role.json"
  task_execute_role_policy_filepath = var.aws_iam_ecs_task_execute_policy_filepath != "" ? var.aws_iam_ecs_task_execute_policy_filepath : "${path.module}/policies/ecs-task-execution-role-policy.json"
  ecs_execute_role_filepath         = var.aws_iam_ecs_execute_role_filepath != "" ? var.aws_iam_ecs_execute_role_filepath : "${path.module}/policies/ecs_execute/ecs_execute_role.json"
  ecs_execute_role_policy_filepath  = var.aws_iam_ecs_execute_role_policy_filepath != "" ? var.aws_iam_ecs_execute_role_policy_filepath : "${path.module}/policies/ecs_execute/ecs_execute_policy.json"
}

# =========================
# AWS IAM - ECS Task Role (角色)
# =========================
resource "aws_iam_role" "task_role" {
  name               = "${var.aws_ecs_service_name}-ecs-task-role"
  assume_role_policy = file(local.task_execute_role_filepath)
}

# =========================
# AWS IAM - ECS Task Role Policy (角色政策)
# https://docs.aws.amazon.com/zh_tw/AmazonECS/latest/developerguide/task_execution_IAM_role.html
# =========================

resource "aws_iam_role_policy" "task_role_policy" {
  name   = "${var.aws_ecs_service_name}-ecs-task-policy"
  policy = file(local.task_execute_role_policy_filepath)
  role   = aws_iam_role.task_role.id
}


# =========================
# Cluster 執行權限
# =========================
resource "aws_iam_role" "ecs_execute_role" {
  name               = "${var.aws_ecs_service_name}-ecs-execute-role"
  assume_role_policy = file(local.ecs_execute_role_filepath)
}

resource "aws_iam_role_policy" "ecs_execute_role_policy" {
  name   = "${var.aws_ecs_service_name}-ecs-execute-policy"
  policy = file(local.ecs_execute_role_policy_filepath)
  role   = aws_iam_role.ecs_execute_role.id
}
