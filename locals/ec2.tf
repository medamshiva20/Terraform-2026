resource "aws_instance" "example"{
    ami = local.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.Allow-tls.id]
    tags = {
        Name = "local.ec2_final_tags"
    }
}

resource "aws_security_group" "Allow-tls"{
    name = "allow-all-terraform" # this is for AWS account
    description = "Allow TLS inbound traffic and all outbound traffic"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge(
        var.common_tags,
        var.sg_tags
    )
}