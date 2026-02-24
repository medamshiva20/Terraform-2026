variable "ami_id"{
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "environment"{
    default = "Dev"
}

variable "instance_type"{
    type = string 
    default = "t2.micro"
}

variable "instances"{
    type = list
    default = ["mongodb","catalogue","redis","user","cart","mysql","shipping","rabbitmq","payment","frontend"]
    }

variable "sg_name"{
    type =string 
    default = "allow-all-terraform-default"
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
        Name = "Allow-all-terraform-count"
        Project = "Roboshop"
        Terraform = true 
        Environment = "Dev"
    }
}

variable "zone_id"{
    default = "Z08049203Q2UXB4YQL1WD"
}

variable "domain_name"{
    default = "sivadevops.site"
}

variable "fruits"{
    type = list(string)
    default = ["apple","banana","apple","orange"]
}

variable "fruites_set"{
    type = set(string)
    default = ["apple","banana","apple","orange"]
}