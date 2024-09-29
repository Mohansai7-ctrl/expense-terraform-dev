resource "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpc_id"  #name you want to give for amazon Systems Manager (SSM)
    value = module.vpc.vpc_id   #vpc_id Which we want to store or push to ssm
    type = "String"


}