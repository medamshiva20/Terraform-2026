resource "aws_instance" "example"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow-all-tls.id]
    count = 10
    tags = {
        Name = var.instances[count.index]  
        Project = "Roboshop" 
    }
}

resource "aws_security_group" "allow-all-tls"{
    name = var.sg_name
    description = var.sg_description

    ingress {
        from_port = var.sg_from_port
        to_port= var.sg_to_port
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