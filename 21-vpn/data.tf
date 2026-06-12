data "aws_ami" "openvpn" {
  owners      = ["444663524611"]
  most_recent = true

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "open_vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/open_vpn_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

# ami-009de10c3ada7e09b