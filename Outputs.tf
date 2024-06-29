 output "webserver_publicIP_address" {
    value = aws_instance.server.public_ip
}

 output "webserver_privateIP_address" { 
    value = aws_instance.server.private_ip
}

 output "webserver_instance_status" {
    value = aws_instance.server.instance_state
}

 output "docker_instance_status" {
    value = aws_instance.docker.instance_state
}

 output "docker_publicIP_address" {
    value = aws_instance.docker.public_ip
}

 output "docker_privateIP_address" {
    value = aws_instance.docker.private_ip
}

 output "sg_id"         {
   value = aws_security_group.terraform_sg.id
 }