data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  prefix = var.prefix
}

resource "aws_ecr_repository" "app" {
  name         = "grp1-ecr"
  force_delete = true
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 5.9.0"

  cluster_name = "grp1-ecs"

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = { weight = 100 }
    }
  }

  services = {
    app-task = {
      cpu    = 512
      memory = 1024
      container_definitions = {
        app-container = {
          essential = true
          image     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${local.prefix}-ecr:latest"
          port_mappings = [{ containerPort = 8080, protocol = "tcp" }]
        }
      }
      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100
      subnet_ids                         = var.subnet_ids
      security_group_ids                 = var.security_group_ids
    }
  }
}
