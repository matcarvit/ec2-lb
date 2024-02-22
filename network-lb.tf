#Terraform Elastic Load Balancer
#---------------------------------------------------------------------------------
locals {
  tags = {
    "Name"        = "OPENVPN-NLB"
    "Description" = "OpenVPN Network Load Balancer Resources"
    "ManagedBy"   = "Terraform Platform"
    "Account"     = "${data.aws_caller_identity.current.account_id}"
    "CreatedAt"   = formatdate("YYYY-MM-DD", timestamp())
  }
}

#Application Load Balancer
resource "aws_lb" "nlb" {
  name                       = "${var.nlb_name}-nlb"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = var.subnet_list_ids
  enable_deletion_protection = true
  tags                       = local.tags
}

#Application Load Balancer - Target Groups
resource "aws_lb_target_group" "nlb_443" {
  name     = "${var.nlb_name}-443-tg"
  port     = 443
  protocol = "TLS"
  vpc_id   = var.vpc_id
  tags     = local.tags
}

resource "aws_lb_target_group" "nlb_943" {
  name     = "${var.nlb_name}-943-tg"
  port     = 943
  protocol = "TLS"
  vpc_id   = var.vpc_id
  tags     = local.tags
}

resource "aws_lb_target_group" "nlb_1194" {
  name     = "${var.nlb_name}-1194-tg"
  port     = 1194
  protocol = "UDP"
  vpc_id   = var.vpc_id
  tags     = local.tags
}

#Application Load Balancer - Attachment
resource "aws_lb_target_group_attachment" "nlb_443" {
  target_group_arn = aws_lb_target_group.nlb_443.arn
  target_id        = aws_instance.ec2.id
  port             = 443
}

resource "aws_lb_target_group_attachment" "nlb_943" {
  target_group_arn = aws_lb_target_group.nlb_943.arn
  target_id        = aws_instance.ec2.id
  port             = 943
}

resource "aws_lb_target_group_attachment" "nlb_1194" {
  target_group_arn = aws_lb_target_group.nlb_1194.arn
  target_id        = aws_instance.ec2.id
  port             = 1194
}