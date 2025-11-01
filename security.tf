resource "aws_security_group" "service" {
  name        = "${local.prefix}-svc-sg"
  description = "Allow inbound app traffic and all egress for ECS tasks"
  vpc_id      = module.vpc.vpc_id
  tags        = local.tags
}

resource "aws_vpc_security_group_ingress_rule" "svc_ingress_app" {
  security_group_id = aws_security_group.service.id
  cidr_ipv4         = var.ingress_cidr
  from_port         = var.container_port
  to_port           = var.container_port
  ip_protocol       = "tcp"
  description       = "App port"
}

resource "aws_vpc_security_group_egress_rule" "svc_egress_all" {
  security_group_id = aws_security_group.service.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "All egress"
}
