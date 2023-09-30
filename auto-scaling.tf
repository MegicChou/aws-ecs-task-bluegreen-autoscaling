# =========================================
# AWS ECS Application 擴展目標
# doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target
# =========================================
resource "aws_appautoscaling_target" "ecs_auto_scaling_target" {
  max_capacity = 60
  min_capacity = var.aws_auto_scaling_target_min_capacity

  # ====================================
  # resource_id 填寫方式
  # doc: https://docs.aws.amazon.com/zh_tw/autoscaling/application/APIReference/API_RegisterScalableTarget.html#API_RegisterScalableTarget_RequestParameters
  # ====================================
  resource_id = "service/${var.aws_ecs_cluster_name}/${aws_ecs_service.main_service.name}"


  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# =========================================
# ecs application auto scaling policy
# doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy
# sample: https://engineering.finleap.com/posts/2020-02-20-ecs-fargate-terraform/
# =========================================

# =========================================
# ECS APP Auto Scaling Policy - CPU
# =========================================

resource "aws_appautoscaling_policy" "aws_autoscaling_cpu" {
  name               = "${var.aws_ecs_service_name}-cpu"
  service_namespace  = aws_appautoscaling_target.ecs_auto_scaling_target.service_namespace
  resource_id        = aws_appautoscaling_target.ecs_auto_scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_auto_scaling_target.scalable_dimension
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value      = 40
    scale_in_cooldown = 60
  }
}


# =========================================
# ECS APP Auto Scaling Policy - Memory
# =========================================

resource "aws_appautoscaling_policy" "aws_autoscaling_memory" {
  name               = "${var.aws_ecs_service_name}-memory"
  service_namespace  = aws_appautoscaling_target.ecs_auto_scaling_target.service_namespace
  resource_id        = aws_appautoscaling_target.ecs_auto_scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_auto_scaling_target.scalable_dimension
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value = 40
  }
}

# =========================================
# ECS APP Auto Scaling Policy - Scheduled
# =========================================