locals {
  ami_id = data.aws_ami.joindevops.id
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
  private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  common_name_suffix = "${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  backend_alb_listiner_arn = data.aws_ssm_parameter.backend_alb_listiner_arn.value
  common_tags = {
    project_name = var.project_name
    environment = var.environment
    Terraform = "true"
  }
}