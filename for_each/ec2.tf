resource "aws_instance" "ec2_instance"{
    ami = "ami-0220d79f3f480ecf5"
    #for_each = var.instances
    for_each = toset(var.instances)
    instance_type = "t2.micro"

    tags = {
        Name = each.key
        Project = "Roboshop"
    }
}
resource "aws_security_group" "allow-all-tls"{
    name = "allow-all-terraform" # this is for AWS account
    description = "Allow TLS inbound traffic and all outbound traffic"

    ingress {
        description = "Allow HTTP from load balancer" 
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
    tags = {
        Name = "Allow-All-Terraform"
    }
}