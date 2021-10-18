terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_security_group" "exam" {
  name        = "exam-security-group"
  description = "Enable Webpage"

  ingress {
    description = "8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "exam" {
  #change the ami for a current one
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name      = "IT4200"
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip},' -u ec2-user --private-key ~/IT4200.pem  exam.yml"
}
}
