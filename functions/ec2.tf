resource "aws_instance" "terraform"{
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.Allow-tls.id]
    tags =merge(
        var.common_tags,
        var.ec2_tags
    )
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