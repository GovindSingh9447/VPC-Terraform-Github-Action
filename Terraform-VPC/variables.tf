variable "vpc_cidr" {
    description = "VPC CIDR RANGE"
    type = string
  
}

variable "subnet_cidr" {
    description = "SUBNET CIDR"
    type = list(string)
  
}