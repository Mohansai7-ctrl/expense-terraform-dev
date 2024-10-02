variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = true
        Environment = "dev"
    }
}

variable "ansible_tags" {
    default = {
        Component = "ansible"
    }
}

variable "mysql_tags" {
    default = {
        Component = "mysql"
    }
}

variable "backend_tags" {
    default = {
        Component = "backend"
    }
}

variable "frontend_tags" {
    default = {
        Component = "frontend"
    }
}

variable "zone_id" {
    default = "Z01771702MEQ3I9CTODSQ"
}

variable "zone_name" {
    default = "mohansai.online"
}