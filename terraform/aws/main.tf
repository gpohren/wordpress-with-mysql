provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "wp_instance" {
  ami                         = var.ami
  instance_type               = var.instance_micro
  subnet_id                   = aws_subnet.public_1a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.wp_sg.id]
  key_name                    = aws_key_pair.wp_key.key_name
  tags = {
    Name = "wp_instance"
  }
}