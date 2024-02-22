#Terraform Security Groups
#---------------------------------------------------------------------------------
locals {
  sg_tags = {
    "Name"        = "OPENVPN-SG"
    "Description" = "OpenVPN Security Groups Resources"
    "ManagedBy"   = "Terraform Platform"
    "Account"     = "${data.aws_caller_identity.current.account_id}"
    "CreatedAt"   = formatdate("YYYY-MM-DD", timestamp())
  }
}


#Security Group for Load Balancer
resource "aws_security_group" "openvpn_sg" {
  name        = "OPENVPN-SG"
  description = "Enable OpenVPN Security Group"
  vpc_id      = var.vpc_id

  #ingress {
  #  description = "SSH Port Access"
  #  protocol    = "tcp"
  #  from_port   = 22
  #  to_port     = 22
  #  cidr_blocks = ["0.0.0.0/0"]
  #}

  ingress {
    description = "HTTPS Port Access"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS UI Port Access"
    protocol    = "tcp"
    from_port   = 943
    to_port     = 943
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "UDP Port Access"
    protocol    = "udp"
    from_port   = 1194
    to_port     = 1194
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.sg_tags
}