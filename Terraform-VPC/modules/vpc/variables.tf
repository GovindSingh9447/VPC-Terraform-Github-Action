variable "vpc_cidr" {
    description = "VPC CIDR RANGE"
    type = string
  
}

variable "subnet_cidr" {
    description = "SUBNET CIDR"
    type = list(string)
  
}

variable "subne_name" {
    description = "SUBNET Name"
    type = list(string)
    default = [ "publicsubnet1", "publicsubnet2" ]
  
}