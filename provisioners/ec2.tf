resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls-provisioners.id]

  provisioner "local-exec" {

         command = "echo ${self.public_ip} > inventory.ini"
  }

  provisioner "local-exec"{
       command = "exit 1"
       on_failure = continue
  }
   
   provisioner "local-exec"{
    command = "echo script-2"
   }
    
    provisioner "local-exec"{
      command = "echo 'Deleting the instance'"
      when = destroy
    }
   
   provisioner "local-exec"{
      when = destroy
      command = "echo > inventory.ini"
   }

   connection{
     type = "ssh"
     user = "ec2-user"
     password = "DevOps321"
     host = self.public_ip
   }

   provisioner "remote-exec"{
        inline = [
          #"sudo dnf install nginx -y",
          #"sudo systemctl start nginx"
          "sudo systemctl stop nginx"
        ]
        when = destroy
   }

  tags = {
    Name = "Terraform"
    Project = "Roboshop"
  }
}

resource "aws_security_group" "allow_tls-provisioners" {

  name        = "allow-all-terraform" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    description = "Allow HTTP from load balancer"  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all-terraform-provisioners"
  }
}


