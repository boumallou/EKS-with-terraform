
resource "aws_lb" "alb" {
  enable_http2                = true
  idle_timeout                = 60
  internal                    = false
  ip_address_type             = "ipv4"
  load_balancer_type          = "application"
  name                        = "${var.app_name}-alb"
  preserve_host_header        = false
  security_groups             = var.vpc_security_group_ids
  subnets                     = var.subnets
    tags = {
    Environment = var.env
    Application = var.app_name
  }
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn           = aws_lb.alb.arn
  port                        = 443
  protocol                    = "HTTPS"
  ssl_policy                  = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn             = var.certificat_arn
  default_action {
    order                     = 1
    type                      = "fixed-response"

    fixed_response {
      content_type            = "text/plain"
      message_body            = "URL not existing"
      status_code             = "404"
    }
  }
}

resource "aws_lb_listener_rule" "listner_rule" {
  listener_arn                = aws_lb_listener.https_listener.arn
  priority                    = 1
  action {
    order                     = 1
    target_group_arn          = aws_lb_target_group.TG.arn
    type                      = "forward"
  }
 condition {
    path_pattern {
      values = ["/*"]
    }
  }
 # condition {
 #   host_header {
 #     values                  = [
 #                              var.host_header_domain,
 #                             ]
 #   }
 # }
}

resource "aws_lb_target_group" "TG" {
  deregistration_delay              = "300"
  ip_address_type                   = "ipv4"
  load_balancing_algorithm_type     = "round_robin"
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  name                              = var.target_group_name
  port                              = 443
  protocol                          = "HTTPS"
  slow_start                        = 0
  target_type                       = "instance"
  vpc_id                            = var.vpc_id
  health_check {
    enabled                         = true
    healthy_threshold               = 5
    interval                        = 30
    matcher                         = "200"
    path                            = "/health-check"
    port                            = "traffic-port"
    protocol                        = "HTTPS"
    timeout                         = 25
    unhealthy_threshold             = 5
  }

  stickiness {
    cookie_duration                 = 86400
    enabled                         = false
    type                            = "lb_cookie"
  }
}

