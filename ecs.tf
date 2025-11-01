module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 5.9.0"

  cluster_name = "${local.prefix}-ecs"

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = { weight = 100 }
    }
  }

  create_task_exec_iam_role = true

  services = {
    app = {
      cpu    = 512
      memory = 1024

     container_definitions = {
  app = {
    essential = true
    image     = "${local.ecr_repository_url}:latest"

    # Use existing log group and set all awslogs options explicitly
    enable_cloudwatch_logging  = false          # don't let the module auto-wire logs
    create_cloudwatch_log_group = false         # don't create a new group
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/aws/ecs/app/app"   # your existing group
        awslogs-region        = var.aws_region
        awslogs-stream-prefix = "app"
      }
    }

    port_mappings = [{
      containerPort = var.container_port
      protocol      = "tcp"
    }]
  }
}

      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100

      subnet_ids         = module.vpc.public_subnets
      security_group_ids = [aws_security_group.service.id]

      desired_count = 1
      enable_execute_command = true
    }
  }

  tags = local.tags
}
