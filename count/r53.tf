resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  count = 10
  # This is interpolation
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[count.index].private_ip]
}


# roboshop.daws88s.online -> public_ip
# As part of functions
resource "aws_route53_record" "www-public" {
  zone_id = var.zone_id
  # interpolation
  name    = "roboshop.${var.domain_name}" # roboshop.sivadevops.site
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[index(var.instances, "frontend")].public_ip]
} 