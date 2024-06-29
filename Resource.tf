resource "aws_instance" "server" {
    ami            = "ami-04629cfb3bd2d73f3"
    instance_type  = "t2.micro"
    key_name       = "Terraform_key"
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]
    user_data = file("./Scripts/webserver.sh")
     tags = {
        "Name" = "Terra_web"  
    }


}

resource "aws_instance" "docker" {
  
    ami            = "ami-04629cfb3bd2d73f3"
    instance_type  = "t2.micro"
    key_name       = "Terraform_key"
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]
    user_data = file("./Scripts/Docker.sh")

    tags = {
        "Name" = "Terra_docker"
        
    }
}

    

resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "Allow SSH & HTT{} inbound traffic and all outbound traffic"
 // vpc_id      = aws_vpc.main.id
 
 //shh port -22
 //http port-80


  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Inbound rule for http"
  }
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Inbound rule for ssh"
   
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    Name = "terraform SG"
  }
}