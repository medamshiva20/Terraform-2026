resource "aws_instance" "aws-example2"{
    ami = var.ami_id
    instance_type = var.environment == "Dev" ? "t3.micro" : "t2.micro"
    tags = var.ec2_tags
}

resource "aws_security_group" "allow-all-tls2"{
    name = var.sg_name
    description = var.sg_description

    ingress{
        from_port = var.sg_from_port
        to_port = var.sg_to_port
        protocol = "-1"
        cidr_blocks = var.sg_cidr_blocks
    }

      egress{
        from_port = var.sg_from_port
        to_port = var.sg_to_port
        protocol = "-1"
        cidr_blocks = var.sg_cidr_blocks
    }
    tags = var.sg_tags
}
