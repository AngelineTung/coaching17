variable "aws_region" { type = string }
variable "prefix"     { type = string }  # e.g. "coaching17"
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }
