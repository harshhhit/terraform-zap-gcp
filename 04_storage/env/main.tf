module "vpc" {
    source = "../../01_network/modules/vpc"
    project = var.project


}

module "subnet" {
    source = "../../01_network/modules/subnet"
     project = var.project
     vpc_network = module.vpc.network_name

    
}

module "templets" {
    source = "../modules/autoscalin-on-instance-MIG/templets"
    project_name = var.project
    
     vpc_network = module.vpc.network_name
    
}

module "rds" {
    source = "../modules/rds"
     project = var.project
     vpc_network = module.vpc.network_name
     
}

