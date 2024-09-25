resource "aws_security_group" "SG" {
  name        = var.SG_name
  description = var.SG_description
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
  dynamic "ingress" {
  for_each = var.ingress_rules
  content {
    from_port       = ingress.value.from
    to_port         = ingress.value.to
    protocol        = ingress.value.protocol
    cidr_blocks     = ingress.value.add_source == 0 ? [ ingress.value.source] : null 
    security_groups = ingress.value.add_source == 1 ? [ ingress.value.source] : null
    prefix_list_ids = ingress.value.add_source == 2 ? [ ingress.value.source] : null
    description     = ingress.value.description
    }
  }
  dynamic "egress" {
  for_each = var.egress_rules
  content {
    from_port       = egress.value.from
    to_port         = egress.value.to
    protocol        = egress.value.protocol
    cidr_blocks     = egress.value.add_source == 0 ? [ egress.value.source] : null 
    security_groups = egress.value.add_source == 1 ? [ egress.value.source] : null
    prefix_list_ids = egress.value.add_source == 2 ? [ egress.value.source] : null
    description     = egress.value.description
    }
  }
# egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }
    tags = {
    Name        = "${var.SG_name}"
  }

}
