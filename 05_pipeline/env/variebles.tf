variable "repo_branch" {
    description = " name of the branch"
    default = "master"
}

variable "repo_name" {
    description = " name of the repoand link"
    default = "https://github.com/harshhhit/terrafor-zep-cloudrun.git"
}

variable "project" {
  description = "The ID of the project where the VPC will be created"c
  default       = "clean-mountain-395906"
}