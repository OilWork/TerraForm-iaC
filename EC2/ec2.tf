resource "aws_instance" "dons_ec2" {
    ami = "ami-0e4a9ad2eb120e054"
    instance_type = "t2.micro"

    tags = {
      "Name" = "DonsEC2"
    }
}  
