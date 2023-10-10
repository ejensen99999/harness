variable "CONFIG" {
    type = string
}

variable "SOURCE_REPO" {
    type = string
}

variable "EMAIL" {
    type = string
}

variable "GITHUB_OWNER" {
    type = string
}

variable "GITHUB_DOWNLOAD" {
    type = string
}

variable "GITHUB_INSTALL" {
    type = string
}

variable "GITHUB_PAT" {
    type = string
}

variable "GITHUB_REPOSITORY" {
    type = string
}

variable "IMAGE_REGISTRY_PATH" {
    type = string
}

variable "NAME" {
    type = string
}

variable "PUSHER" {
    type = string
}

variable "RUNNER_DIR" {
    type = string
    default = "/runnertmp"
}

variable "RUNNER_EPHEMERAL" {
    type = string
    default = "true"
}

variable "RUNNER_LABELS" {
    type = list(string)
    default = ["coldstone", "ubuntu20.04", "linux"]
}

variable "WORKING_DIR" {
    type = string
    default = "/home/github"
}

locals {
  provisioning  = "${path.root}/../../ansible"
  support_folder = "${path.root}/support"
  TEMPLATE_DIR   = path.root
}