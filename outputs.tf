output "ec2_host_id" {
  value = aws_instance.ec2.host_id
}

output "nlb_dns" {
  value = aws_lb.nlb.dns_name
}

output "security_group_id" {
  value = aws_security_group.openvpn_sg.id
}