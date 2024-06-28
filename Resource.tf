resource "aws_instance" "server" {
    ami           = "ami-04629cfb3bd2d73f3"
    instance_type = "t2.micro"
    key_name = "Terraform_key"
    tags = {
        "Name" = "Terra_imp"
    }
}