locals {
  prefix = var.prefix
  tags   = { Project = local.prefix }
  # Compose the ECR URL from the existing repository name
  ecr_repository_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${var.ecr_repository_name}"
}
