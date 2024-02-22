#Terraform Elastic Container Registry
#---------------------------------------------------------------------------------
locals {
  ec2_tags = {
    "Name"        = "OPENVPN-EC2"
    "Description" = "OpenVPN EC2 Resources"
    "ManagedBy"   = "Terraform Platform"
    "Account"     = "${data.aws_caller_identity.current.account_id}"
    "CreatedAt"   = formatdate("YYYY-MM-DD", timestamp())
  }
}

#Instance
resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.ec2_kms_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.openvpn_sg.id]
  monitoring                  = true
  associate_public_ip_address = true

  ebs_block_device {
    device_name           = "/dev/sda1"
    delete_on_termination = true
    encrypted             = true
    volume_size           = 20
    volume_type           = "gp3"
    tags                  = local.ec2_tags
  }

  tags = local.ec2_tags
}