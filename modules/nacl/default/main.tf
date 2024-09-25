resource "aws_default_network_acl" "main" { 
  default_network_acl_id = var.default-nacl-id 
  subnet_ids = var.subnetID
  dynamic "ingress" {
  for_each = var.nacl_ingress_rule
  content {
    protocol   = ingress.value.protocol
    rule_no    = ingress.value.rule-number
    action     = ingress.value.rule-action
    cidr_block = ingress.value.cidr-block
    from_port  = ingress.value.from-port
    to_port    = ingress.value.to-port
    }
    }
  dynamic "egress" {
  for_each = var.nacl_egress_rule
  content {
    protocol   = egress.value.protocol
    rule_no    = egress.value.rule-number
    action     = egress.value.rule-action
    cidr_block = egress.value.cidr-block
    from_port  = egress.value.from-port
    to_port    = egress.value.to-port
    }
    }
  tags = var.tag
}
