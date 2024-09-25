resource "aws_route53_record" "www" {
  zone_id = var.HostedZoneId
  name    = var.RecordName //"www.example.com"
  type    = "A"
    alias {
    name                   = var.ELB-dns-name //aws_elb.main.dns_name
    zone_id                = var.ELB-ZoneID //aws_elb.main.zone_id
    evaluate_target_health = true
  }
}