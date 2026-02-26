resource "aws_instance" "terraform"{
    ami = data.aws_ami.sivadevops.id
    for_each = var.instances
    vpc_security_group_ids = [aws_security_group.allow-tls.id]
    instance_type = each.value
    tags ={
        Name = each.key
    }
}

resource "aws_security_group" "allow-tls"{
    name = var.sg_name
    description = var.sg_description

    ingress{
        from_port = var.sg_from_port
        to_port = var.sg_to_port
        protocol = var.sg_protocol
        cidr_blocks = var.sg_cidr_blocks
    }

    egress{
        from_port = var.sg_from_port
        to_port = var.sg_to_port
        protocol = var.sg_protocol
        cidr_blocks = var.sg_cidr_blocks
    }
    tags = var.sg_tags
}