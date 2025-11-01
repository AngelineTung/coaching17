data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}
data "aws_ecr_repository" "ecr" {
  name = var.ecr_repository_name
}

