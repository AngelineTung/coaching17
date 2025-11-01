variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "prefix" {
  description = "Name prefix for resources"
  type        = string
  default     = "demo"
}

variable "container_port" {
  description = "App port exposed by the container"
  type        = number
  default     = 8080
}

variable "ingress_cidr" {
  description = "CIDR allowed to reach the service (tighten for prod)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ecr_repository_name" {
  description = "Existing ECR repository name (must already exist)"
  type        = string
  default     = "grp1-ecr"
}


