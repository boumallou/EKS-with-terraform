output "ALB" {
 value = aws_lb.alb 
}
output "TG-ARN" {
  value = aws_lb_target_group.TG.arn
}