#Root module is terraform-aws-security-group

module "mysql_sg" {
    #source = "git::https://github.com/Mohansai7-ctrl/terraform-aws-security-group.git?ref=main"
    source = "../../terraform-aws-security-group"
    vpc_id = local.vpc_id
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
    sg_name = "mysql"
}