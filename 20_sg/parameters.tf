resource "aws_ssm_parameter" "mysql_sg_id" {
    name = "/${var.project_name}/${var.environment}/mysql_sg_id"
    value = module.mysql_sg.id
    type = "String"
}

resource "aws_ssm_parameter" "backend_sg_id" {
    name = "/${var.project_name}/${var.environment}/backend_sg_id"
    value = module.backend_sg.id
    type = "String"

}

resource "aws_ssm_parameter" "frontend_sg_id" {
    name = "/${var.project_name}/${var.environment}/frontend_sg_id"
    value = module.frontend_sg.id
    type = "String"

}

resource "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.project_name}/${var.environment}/bastion_sg_id"
    value = module.bastion_sg.id
    type = "String"
}

resource "aws_ssm_parameter" "ansible_sg_id" {
    name = "/${var.project_name}/${var.environment}/ansible_sg_id"
    value = module.ansible_sg.id
    type = "String"
}