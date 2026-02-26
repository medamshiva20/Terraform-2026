

variable "instances"{
    type  = map
    default  = {
        mongodb = "t2.micro"
        catalogue ="t2.micro"
        }
}

variable "sg_name"{
    type = string
    default = "allow-all-terraform-default"
}

variable "sg_description"{
    type =string
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

variable "sg_protocol"{
    type = string
    default = "tcp"
}

variable "sg_cidr_blocks"{
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags"{
    type = map
    default = {
        Name = "Allow-All-Traffic"
        Environment= "Dev"
        Terraform = true
    }
}