provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAWCCS5BFRDTLEEYHE"
  secret_key = "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"
}

  data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
  name = "name"
  values = ["amzn-ami-hvm*-x86_64-gp2"]
}
}
  resource "aws_instance" "web" {
  ami           = data.aws_ami.server_ami.id
  instance_type = "t2.micro"
  key_name = "ADC_Demo_Linux"
  tags = {
  Name = "TemporaryVMBuild"
  security_groups = "ADC_Security"
}
}
