provider "aws" {
  region = "us-east-1"
}

resource "aws_cloudwatch_metric_alarm" "instance-health-check" {
  alarm_name                = "instance-health-check"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "StatusCheckFailed"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "1"
  alarm_description         = "This metric monitors ec2 health status"
  alarm_actions             = [ "arn:aws:sns:us-east-XXXXXXXXXXXXXXXXX" ]
dimensions = {
    InstanceId = "XXXXXXXXXXXXXX"
  }
}