variable "common_tags"{
    default = {
        Project = "Roboshop"
        Terraform = true
        Environment = "Dev"
    }
}

variable "ec2_tags"{
    default = {
        Name = "functions.demo"
        Environment = "prod"
    }
}

variable "sg_tags"{
    default = {
        Name = "functions-demo"
    }
}