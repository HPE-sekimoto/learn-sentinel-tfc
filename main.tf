provider "aws" {
  region = var.region
#   access_key = var.AWS_ACCESS_KEY_ID
#   secret_key = var.AWS_SECRET_ACCESS_KEY
}

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"]
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  # root_block_device {
  #   encrypted = true
  # }

  metadata_options {
    http_endpoint = "enabled"  # Set this to "enabled" or "disabled"
    http_tokens = "required"
  }
  
  disable_api_termination = true
}
