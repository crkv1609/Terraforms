// name = value
// data types: interger, string, boolean, list, dictionary

// image_id = "ami-04629cfb3bd2d73f3"

variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "image_id" {
    type = string
    default = "ami-04629cfb3bd2d73f3"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "Terraform_key"
}


variable "webserver_script" {
    type = string
    default = "./scripts/webserver.sh"
}


variable "docker_script" {
    type = string
    default = "./scripts/Docker.sh"
}


variable "webserver_tags" {
    type = map(string)
    default = {
      "Name" = "Terra_web"
      "Owner" = "crkv"
    }
}


variable "Dockerserver_tags" {
    type = map(string)
    default = {
      "Name" = "Terra_docker"
      "Owner" = "crkv"
    }
}


variable "sg_ports" {
    type = list(number)
    default = [ 80, 22, 443 ]
}


variable "sg_cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}


variable "sg_tags" {
    type = map(string)
    default = {
      "Name" = "terraform SG"
      "Owner" = "crkv"
    }
}