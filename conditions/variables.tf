variable "environment"{
    default = "prod"
}

variable "ami_id"{
    type = string 
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type"{
    type = string 
    default = "t2.micro"
}

variable "ec2_tags"{
    type = map
    default = {
        Name = "conditions-demo"
        Project = "Roboshop"
        Terraform = true
        Environment = "Dev"
    }
}

variable "sg_name"{
    type = string
    default = "Allow-all-terraform-default2"
}

variable "sg_description"{
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_from_port"{
    type = number
    default = 0
}

variable "sg_to_port"{
    type = number
    default = 0
}

variable "sg_cidr_blocks"{
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags"{
    type = map
    default = {
        Name = "Allow-all-traffic"
        Project = "Roboshop"
        Terraform = true
        Environment = "Dev"
    }
}