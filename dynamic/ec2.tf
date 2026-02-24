resource "aws_instance" "ec2_instance"{
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow-all-tls.id]

    tags ={
        Name = "terraform"
        Project = "Roboshop"
    }
}

resource "aws_security_group" "allow-all-tls"{
    name = "allow-all-terraform" # this is for AWS account
    description = "Allow TLS inbound traffic and all outbound traffic"

 dynamic "ingress" {
        #for_each = var.ingress_rules
        for_each = toset(var.ingress_rules)
        content{
        from_port = ingress.value.port 
        to_port = ingress.value.port
        protocol = "tcp"
        cidr_blocks = ingress.value.cidr_blocks
        }
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Allow-all-sg"
    }
}