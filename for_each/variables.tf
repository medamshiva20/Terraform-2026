#variable "instances"{
    #type = map
    #default = {
    #mongodb = "t2.micro"
    #catalogue = "t2.small"
    #redis = "t3.micro"
   # user = "t3.small"
  #  cart = "t3.medium"
 #   }
#}

variable "instances"{
    type = list
    default = ["mongodb","catalogue"]
}

variable "zone_id"{
    type = string
    default = "Z08049203Q2UXB4YQL1WD"
}

variable "domain_name"{
    type = string
    default = "sivadevops.site"
}