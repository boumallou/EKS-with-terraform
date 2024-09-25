resource "aws_launch_configuration" "web" {
  name_prefix = var.prefix
  image_id = var.image_id 
  instance_type = var.instance_size
  key_name = var.key_name
  security_groups = [ var.sg_id ]
  ebs_optimized = true
 # associate_public_ip_address = true
  iam_instance_profile = var.InstanceProfile
  user_data = var.UserData
//  user_data = "${file("data.sh")}"
  lifecycle {
    create_before_destroy = true
  }
  root_block_device {
    volume_type = "gp3"
    volume_size = 64
    encrypted = true
  }
#    metadata_options {
#    http_tokens                 = "required"
#    http_put_response_hop_limit = 2
#    http_endpoint               = "enabled"
#  }

}
resource "aws_autoscaling_group" "web" {
  name = "${aws_launch_configuration.web.name}-asg"
  min_size             = 1
  desired_capacity     = 1
  max_size             = 2
  health_check_type    = "ELB"
#  health_check_grace_period = 300
launch_configuration = "${aws_launch_configuration.web.name}"
enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
metrics_granularity = "1Minute"
vpc_zone_identifier  = var.subnets
tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }
tag {
    key                 = "Name"
    value               = "${var.prefix}-${var.env}"
    propagate_at_launch = true
  }
  tag {
    key                 = "Application"
    value               = var.prefix
    propagate_at_launch = true
  }
instance_refresh {
strategy = "Rolling"
preferences {
    min_healthy_percentage = 50
  }
  }
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
  target_group_arns = [var.target_group_arn]
}



resource "aws_autoscaling_policy" "web_policy_up" {
  name = "web_policy_up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.web.name}"
}
resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_up" {
  alarm_name = "web_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "70"
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.web.name}"
  }
alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ "${aws_autoscaling_policy.web_policy_up.arn}" ]
}
resource "aws_autoscaling_policy" "web_policy_down" {
  name = "web_policy_down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.web.name}"
}
resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down" {
  alarm_name = "web_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "30"
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.web.name}"
  }
alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ "${aws_autoscaling_policy.web_policy_down.arn}" ]
}