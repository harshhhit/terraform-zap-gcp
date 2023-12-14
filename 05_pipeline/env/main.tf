module "code_build" {
    source = "../modules/"
    repo_branch = var.repo_branch
    repo_name = var.repo_name
    project = var.project 
    
}


