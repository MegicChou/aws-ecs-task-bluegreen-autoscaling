# =======================
# docker image 放置區
# =======================
resource "aws_ecr_repository" "web_repository" {
  name = var.aws_ecr_repository_name
}