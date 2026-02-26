resource "aws_route53_record" "www"{
    for_each = aws_instance.ec2_instance
    zone_id = var.zone_id
    type = "A"
    ttl = 1
    name = "${each.key}.${var.domain_name}"
    records = [each.value.private_ip]
    allow_overwrite = true 
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  # interpolation
  name    = "roboshop.${var.domain_name}" # mongodb.daws88s.online
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.example, "frontend").public_ip]
  allow_overwrite = true
}