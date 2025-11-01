output "ecr_repository_name" {
  value = aws_ecr_repository.app.name
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

# The service key you used above ("app-task") becomes part of the service name
# The module exposes services map outputs—adjust to your version’s outputs:
output "ecs_service_name" {
  value = module.ecs.services["app-task"].name
}

output "task_definition_name" {
  value = module.ecs.services["app-task"].task_definition_family
}

output "container_name" {
  value = "app-container"
}
