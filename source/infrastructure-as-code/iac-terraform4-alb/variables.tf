variable "name" {
  
}

variable "aws_instance_type" {
    default = "t3.nano"

}

variable "vpc_id" {
    type = string
    description = "vpc_id"
    default = "vpc-04022def7485261bb"	
}