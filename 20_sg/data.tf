data "aws_ssm_parameter" "vpc_id" { #resource name can be anything
    name = "/${var.project_name}/${var.environment}/vpc_id"  #we are getting from aws services ssm parameter using data source, name as vpc_id, this is the same name we have to give which we used for ssm creation in 10_vpc
}