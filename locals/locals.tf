locals{
   instance_name = "${var.name}-${var.environment}"
    instance_type = "t2.micro"
    ami_id = data.aws_ami.sivadevops.id
}

locals{
    common_tags = {
        Project = "Roboshop"
        Terraform = true
        Environment = "Dev"
    }
    ec2_final_tags = merge(local.common_tags,var.ec2_tags)
}