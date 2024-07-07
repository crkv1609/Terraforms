data "aws_ami" "aws_ec2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



resource "aws_instance" "server" {
    ami            = data.aws_ami.aws_ec2.id //var.image_id   //"ami-04629cfb3bd2d73f3"
    instance_type  = var.instance_type  //"t2.micro"
    key_name       = var.key_pair       //"Terraform_key"
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]
    user_data = file(var.webserver_script)   //"./Scripts/webserver.sh"
     tags = var.webserver_tags
     provisioner "local-exec" {
      command    = "echo ${self.private_ip} > private_IPs.txt"
    }

    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
      private_key = file("./terraform_key.pem")
    }

    provisioner "file" {
      source      = "private_IPs.txt"
      destination = "/tmp/private_IPs.txt"
    }

    provisioner "file" {
      source      = "scripts/provisioner.sh"
      destination = "/tmp/provisioner.sh"
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/provisioner.sh",
        "/tmp/provisioner.sh",
      ]
    }

}

resource "aws_instance" "docker" {
  
    ami            = data.aws_ami.aws_ec2.id  // var.image_id        //"ami-04629cfb3bd2d73f3"
    instance_type  = var.instance_type  //"t2.micro"
    key_name       = var.key_pair       //"Terraform_key"
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]
    user_data = file(var.docker_script)   //"./Scripts/Docker.sh"

    tags = var.Dockerserver_tags
    provisioner "local-exec" {
      command    = "echo ${self.private_ip} >> private_IPs.txt"
    }

    connection {
      type     = "ssh"
      user     = "ec2-user"
      host     = self.public_ip
      private_key = file("./terraform_key.pem")
    }

    provisioner "file" {
      source      = "private_IPs.txt"
      destination = "/tmp/private_IPs.txt"
    }
}

    

resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "Allow SSH & HTT{} inbound traffic and all outbound traffic"
 // vpc_id      = aws_vpc.main.id
 //shh port -22
 //http port-80

     dynamic "ingress" {
      for_each = var.sg_ports
      iterator = port
      content {
        from_port    = port.value
        to_port      = port.value
        protocol     = "tcp"
        cidr_blocks  = var.sg_cidr_block   //["0.0.0.0/0"]
      }
    }
  # TO COMMENT ctrl+K+C
  
  #  ingress {
  #   from_port        = var.sg_ports[0]
  #   to_port          = var.sg_ports[0]
  #   protocol         = "tcp"
  #   cidr_blocks      = var.sg_cidr_block 
  #   description      = "Inbound rule for http"
  # }
  # TO COMMENT ctrl+K+C
  # ingress {
  #   from_port        = var.sg_ports[1]
  #   to_port          = var.sg_ports[1]
  #   protocol         = "tcp"
  #   cidr_blocks      = var.sg_cidr_block
  #   description      = "Inbound rule for ssh"
  # }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr_block
   
  }

  tags = var.sg_tags
}