resource "aws_key_pair" "my_key" {
    key_name = "${var.env}-infra-app-key"
    public_key = file("./infra-app/terra-key-ec2.pub")

    tags = {
      Environment=var.env
    }
}



resource "aws_default_vpc" "default" {
  
}


resource "aws_security_group" "my_security_group" {
  name = "${var.env}-infra-app-security-group"
  description = "this will add a tf generated security group"
  vpc_id = aws_default_vpc.default.id

  #inbound rule
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }


  #outbound rule

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "All access outbound"
  }
  
  tags = {
    Name="${var.env}-infra-app-security-group"
    Environment=var.env
  }
   
}


resource "aws_instance" "my_instance" {
  
    count=var.instance_count
    
    key_name = aws_key_pair.my_key.key_name
    security_groups = [ aws_security_group.my_security_group.name ]
    instance_type = var.instance_type
    ami = var.aws_ami_id #ubuntu
    root_block_device {
      volume_size = var.env=="prod" ? 20 : 10
      volume_type = "gp3"
    }
  tags = {
    Name="${var.env}-infra-app-instance"
    Environment=var.env
  }
}