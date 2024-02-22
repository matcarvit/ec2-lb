variable "region" {
  type        = string
  description = "AWS Cloud Region (Required)"
  default     = "us-east-1" #Norte da Virgínia
}

#Set your credentials profile
variable "profile" {
  type        = string
  description = "AWS Credentials Profile (Required)"
  default     = "YOUR-PROFILE" #AWS Profile
}

#Set your OpenVPN AMI 
variable "ami_id" {
  type        = string
  description = "AMI ID (Required)"
  default     = "YOUR-AMI"
}

#Set an Instance Type
variable "instance_type" {
  type        = string
  description = "Instance Type (Required - Default is t2.small)"
  default     = "t2.small"
}

#Set a KMS Name
variable "ec2_kms_name" {
  type        = string
  description = "KMS Name (for EC2) (Required)"
  default     = "YOUR-KMS"
}

#Set a VPC ID
variable "vpc_id" {
  type        = string
  description = "KMS ARN (Required)"
  default     = "YOUR-VPC"
}

#Set a Subnet ID for OpenVPN EC2
variable "subnet_id" {
  type        = string
  description = "Subnet ID (Required - This subnet is for EC2)"
  default     = "YOUR-SUBNET"
}

#Set yor NLB name
variable "nlb_name" {
  type        = string
  description = "AMI ID (Required)"
  default     = "OPENVPN-EC2"
}

#Set a SSL Certificate ARN
variable "ssl_certificate_arn" {
  type        = string
  description = "SSL Certificate ARN (Required)"
  default     = "YOUR-SSL-CERTIFICATE"
}

#Set a created subnets for NLB
variable "subnet_list_ids" {
  type        = list(string)
  description = "List of Subnets IDs (Required - Theses subnets are for Network Load Balancer)"
  default = [
    "YOUR-SUBNET-1",
    "YOUR-SUBNET-2",
    "YOUR-SUBNET-3"
  ]
}

