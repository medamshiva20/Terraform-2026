variable "name"{
    type = string 
    default = "locals"
}

variable "environment"{
    type = string 
    default = "Dev"
}

#variable "instance_name"{
 #   default = "${var.name}-${var.environment}"
#}


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