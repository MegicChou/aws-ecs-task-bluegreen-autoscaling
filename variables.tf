variable "aws_region" {
  type        = string
  description = "aws region"
}

variable "aws_ecs_cluster_id" {
  type        = string
  description = "AWS ECS Cluster ID"
}

variable "aws_ecr_repository_name" {
  type        = string
  description = "aws ecr repository name"
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "AWS ECS Cluster Name"
}

variable "aws_ecs_service_name" {
  type        = string
  description = "AWS ECS Service Name"
}

variable "aws_ecs_desired_count" {
  type        = number
  description = "AWS ECS 容器預設的所需啟動數量"
  default     = 1
}

variable "aws_ecs_task_definition_cpu" {
  type        = number
  default     = 256
  description = "AWS ECS Task CPU 規格"
}

variable "aws_ecs_task_definition_memory" {
  type        = number
  default     = 512
  description = "AWS ECS Task CPU 規格"
}

variable "aws_ecs_service_subnet_list" {
  type        = list(string)
  description = "AWS ECS Service Security Group 安全群組清單"
}

variable "aws_ecs_service_cloudwatch_log_prefix_name" {
  type        = string
  description = "AWS ECS Service CloudWatch Log"
}

variable "aws_security_group_ids" {
  type        = list(string)
  description = "AWS 安全群組"
}

# ============================
# AWS LB
# ============================

variable "aws_target_group_arn" {
  type        = string
  description = "AWS Target Group Arn"
}

variable "task_container_port" {
  type        = number
  description = "容器對外服務 port"
}

variable "task_container_name" {
  type        = string
  description = "容器名稱"
}

# ============================
# AWS VPC
# ============================

variable "aws_vpc_id" {
  type        = string
  description = "aws vpc id"
}

# ============================
# AWS Auto Scaling
# ============================

variable "aws_auto_scaling_target_min_capacity" {
  type        = string
  description = "AWS ECS Auto Scaling Target Min Capacity （容器最少啟動數）"
}

# ============================
# AWS IAM
# ============================
variable "aws_iam_ecs_task_execute_filepath" {
  type        = string
  description = "AWS ECS TASK EXECUTE IAM 政策檔案路徑 （為空採用預設）"
  default     = ""
}

variable "aws_iam_ecs_task_execute_policy_filepath" {
  type        = string
  description = "AWS ECS TASK EXECUTE POLICY IAM 政策檔案路徑 （為空採用預設）"
  default     = ""
}

variable "aws_iam_ecs_execute_role_filepath" {
  type        = string
  default     = ""
  description = "AWS ECS EXECUTE IAM 政策檔案路徑（為空採用預設）"
}

variable "aws_iam_ecs_execute_role_policy_filepath" {
  type        = string
  default     = ""
  description = "AWS ECS EXECUTE POLICY IAM 政策檔案路徑（為空採用預設）"
}