terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "us-east-1"
}

provider "aws" {
  region = "us-east-2"
  alias = "us-east-2"
}

resource "aws_instance" "dev_us_east_1" {
  # count = 1
  provider = aws.us-east-1
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "ec2_dev"
    # Name = "ec2_dev${count.index}"
  }
  vpc_security_group_ids = [ "${aws_security_group.sg_ssh_us_east_1.id}" ]
  depends_on = [
    aws_dynamodb_table.dinamodb_homolog_us_east_1
  ]
}

resource "aws_dynamodb_table" "dinamodb_homolog_us_east_1" {
  provider = aws.us-east-1
  name = "ddb_game_score"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "user_id"
  range_key = "game_title"
  attribute {
    name = "user_id"
    type = "S"
  }
  attribute {
    name = "game_title"
    type = "S"
  }
}
