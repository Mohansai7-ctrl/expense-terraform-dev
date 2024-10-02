#Creating ansible server:

module "ansible" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "${local.resource_name}-ansible"
    ami = data.aws_ami.ami_info.id

    vpc_security_group_ids = [local.ansible_sg_id]
    subnet_id = local.public_subnet_ids

    user_data = file("expense.sh")

    tags = merge(
        var.common_tags,
        var.ansible_tags,
        {
            Name = "${local.resource_name}-ansible"
        }
    )

}

#Creating mysql server:

module "mysql" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "${local.resource_name}-mysql"
    ami = data.aws_ami.ami_info.id

    vpc_security_group_ids = [local.mysql_sg_id]
    subnet_id = local.database_subnet_ids

    tags = merge(
        var.common_tags,
        var.mysql_tags,
        {
            Name = "${local.resource_name}-mysql"
        }
    )

}

#Creating backend server:

module "backend" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "${local.resource_name}-backend"
    ami = data.aws_ami.ami_info.id

    vpc_security_group_ids = [local.backend_sg_id]
    subnet_id = local.private_subnet_ids

    tags = merge(
        var.common_tags,
        var.backend_tags,
        {
            Name = "${local.resource_name}-backend"
        }
    )

}

#Creating frontend server:

module "frontend" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "${local.resource_name}-frontend"
    ami = data.aws_ami.ami_info.id

    vpc_security_group_ids = [local.frontend_sg_id]
    subnet_id = local.public_subnet_ids

    tags = merge(
        var.common_tags,
        var.frontend_tags,
        {
            Name = "${local.resource_name}-frontend"
        }
    )

}

#creating records:

module "records" {
    source = "terraform-aws-modules/route53/aws//modules/records"
    zone_name = var.zone_name   #zone_id is not needed, instead of domain_name here we used zone_name
    
    records = [
        {
            records = [
                module.mysql.private_ip
            ]
            name = "mysql"   #Though we provided name as mysql, but it will provide as mysql.zone_name terraform comgines both zone_name and name.
            type = "A"
            ttl = 1
            allow_overwrite = true
        },

        {
            name = "backend"
            type = "A"
            ttl = 1
            allow_overwrite = true
            records = [
                module.backend.private_ip
            ]
        },

        {
            name = "frontend"
            type = "A"
            ttl = 1
            allow_overwrite = true
            records = [
                module.frontend.private_ip
            ]

        },

        {
            name = ""
            type = "A"
            ttl = 1
            allow_overwrite = true
            records = [
                module.frontend.public_ip
            ]
        }
    ]
}