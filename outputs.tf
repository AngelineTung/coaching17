output "ecr_repo_name" {
  description = "ECR repository name"
  value       = var.ecr_repository_name
}

output "ecs_cluster" {
  description = "ECS cluster name"
  value       = module.ecs.cluster_name
}
