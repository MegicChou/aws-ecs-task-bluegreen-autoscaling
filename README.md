# AWS ECS Fargate BlueGreen Codedeploy Template

修改專案：https://github.com/msfidelis/ecs-pipeline

## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (5.19.0)

- <a name="provider_template"></a> [template](#provider\_template) (2.2.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_appautoscaling_policy.aws_autoscaling_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) (resource)
- [aws_appautoscaling_policy.aws_autoscaling_memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) (resource)
- [aws_appautoscaling_target.ecs_auto_scaling_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) (resource)
- [aws_cloudwatch_log_group.service-log-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) (resource)
- [aws_ecr_repository.web_repository](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) (resource)
- [aws_ecs_service.main_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) (resource)
- [aws_ecs_task_definition.web-task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) (resource)
- [aws_iam_role.ecs_execute_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) (resource)
- [aws_iam_role_policy.ecs_execute_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) (resource)
- [aws_iam_role_policy.task_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) (resource)
- [template_file.container_definitions](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_aws_auto_scaling_target_min_capacity"></a> [aws\_auto\_scaling\_target\_min\_capacity](#input\_aws\_auto\_scaling\_target\_min\_capacity)

Description: AWS ECS Auto Scaling Target Min Capacity （容器最少啟動數）

Type: `string`

### <a name="input_aws_ecr_repository_name"></a> [aws\_ecr\_repository\_name](#input\_aws\_ecr\_repository\_name)

Description: aws ecr repository name

Type: `string`

### <a name="input_aws_ecs_cluster_id"></a> [aws\_ecs\_cluster\_id](#input\_aws\_ecs\_cluster\_id)

Description: AWS ECS Cluster ID

Type: `string`

### <a name="input_aws_ecs_cluster_name"></a> [aws\_ecs\_cluster\_name](#input\_aws\_ecs\_cluster\_name)

Description: AWS ECS Cluster Name

Type: `string`

### <a name="input_aws_ecs_service_cloudwatch_log_prefix_name"></a> [aws\_ecs\_service\_cloudwatch\_log\_prefix\_name](#input\_aws\_ecs\_service\_cloudwatch\_log\_prefix\_name)

Description: AWS ECS Service CloudWatch Log

Type: `string`

### <a name="input_aws_ecs_service_name"></a> [aws\_ecs\_service\_name](#input\_aws\_ecs\_service\_name)

Description: AWS ECS Service Name

Type: `string`

### <a name="input_aws_ecs_service_subnet_list"></a> [aws\_ecs\_service\_subnet\_list](#input\_aws\_ecs\_service\_subnet\_list)

Description: AWS ECS Service Security Group 安全群組清單

Type: `list(string)`

### <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region)

Description: aws region

Type: `string`

### <a name="input_aws_security_group_ids"></a> [aws\_security\_group\_ids](#input\_aws\_security\_group\_ids)

Description: AWS 安全群組

Type: `list(string)`

### <a name="input_aws_target_group_arn"></a> [aws\_target\_group\_arn](#input\_aws\_target\_group\_arn)

Description: AWS Target Group Arn

Type: `string`

### <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id)

Description: aws vpc id

Type: `string`

### <a name="input_task_container_name"></a> [task\_container\_name](#input\_task\_container\_name)

Description: 容器名稱

Type: `string`

### <a name="input_task_container_port"></a> [task\_container\_port](#input\_task\_container\_port)

Description: 容器對外服務 port

Type: `number`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_ecs_desired_count"></a> [aws\_ecs\_desired\_count](#input\_aws\_ecs\_desired\_count)

Description: AWS ECS 容器預設的所需啟動數量

Type: `number`

Default: `1`

### <a name="input_aws_ecs_task_definition_cpu"></a> [aws\_ecs\_task\_definition\_cpu](#input\_aws\_ecs\_task\_definition\_cpu)

Description: AWS ECS Task CPU 規格

Type: `number`

Default: `256`

### <a name="input_aws_ecs_task_definition_memory"></a> [aws\_ecs\_task\_definition\_memory](#input\_aws\_ecs\_task\_definition\_memory)

Description: AWS ECS Task CPU 規格

Type: `number`

Default: `512`

### <a name="input_aws_iam_ecs_execute_role_filepath"></a> [aws\_iam\_ecs\_execute\_role\_filepath](#input\_aws\_iam\_ecs\_execute\_role\_filepath)

Description: AWS ECS EXECUTE IAM 政策檔案路徑（為空採用預設）

Type: `string`

Default: `""`

### <a name="input_aws_iam_ecs_execute_role_policy_filepath"></a> [aws\_iam\_ecs\_execute\_role\_policy\_filepath](#input\_aws\_iam\_ecs\_execute\_role\_policy\_filepath)

Description: AWS ECS EXECUTE POLICY IAM 政策檔案路徑（為空採用預設）

Type: `string`

Default: `""`

### <a name="input_aws_iam_ecs_task_execute_filepath"></a> [aws\_iam\_ecs\_task\_execute\_filepath](#input\_aws\_iam\_ecs\_task\_execute\_filepath)

Description: AWS ECS TASK EXECUTE IAM 政策檔案路徑 （為空採用預設）

Type: `string`

Default: `""`

### <a name="input_aws_iam_ecs_task_execute_policy_filepath"></a> [aws\_iam\_ecs\_task\_execute\_policy\_filepath](#input\_aws\_iam\_ecs\_task\_execute\_policy\_filepath)

Description: AWS ECS TASK EXECUTE POLICY IAM 政策檔案路徑 （為空採用預設）

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url)

Description: n/a

### <a name="output_ecs_cloudwatch_log_name"></a> [ecs\_cloudwatch\_log\_name](#output\_ecs\_cloudwatch\_log\_name)

Description: n/a

### <a name="output_ecs_iam_execute_role_arn"></a> [ecs\_iam\_execute\_role\_arn](#output\_ecs\_iam\_execute\_role\_arn)

Description: n/a

### <a name="output_ecs_iam_task_execute_role_arn"></a> [ecs\_iam\_task\_execute\_role\_arn](#output\_ecs\_iam\_task\_execute\_role\_arn)

Description: n/a

### <a name="output_ecs_iam_task_role_arn"></a> [ecs\_iam\_task\_role\_arn](#output\_ecs\_iam\_task\_role\_arn)

Description: n/a

### <a name="output_ecs_service_cloudwatch_log_name"></a> [ecs\_service\_cloudwatch\_log\_name](#output\_ecs\_service\_cloudwatch\_log\_name)

Description: n/a

### <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name)

Description: n/a

### <a name="output_ecs_task_definition_family"></a> [ecs\_task\_definition\_family](#output\_ecs\_task\_definition\_family)

Description: n/a
