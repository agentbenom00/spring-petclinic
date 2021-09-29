terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  #change the ami for a current one
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
}

resource "aws_instance" "example2" {
  #change the ami for a current one
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
}



