variable "CONFIG" { type = string }
variable "EMAIL" { type = string }
variable "NAME" {  type = string }
variable "LABELS" { default = ["harness", "ubuntu20.04", "linux"]}

variable "IMAGE_REGISTRY_PATH" { type = string }

locals {
  provisioning  = "${path.root}/ansible"
  support_folder = "${path.root}/support"
  scripts = "${path.root}/configs"
  TEMPLATE_DIR   = path.root
}

packer {
    required_plugins {
        docker = {
            source  = "github.com/hashicorp/docker"
            version = "~> 1"
        }
        ansible = {
            source  = "github.com/hashicorp/ansible"
            version = "~> 1"
        }
    }
}

source "docker" "delegate-linux" {
    image = "harness/delegate:latest"
    commit = true
}

build { 
    name = "base"
    sources = ["sources.docker.delegate-linux"]

    provisioner "shell" {
        inline = [
            "mkdir /support"
        ]
    }

    provisioner "file" {
        source = "${path.root}/support/"
        destination = "/support"
    }

    provisioner "shell" {
        environment_vars = [
            "DEBIAN_FRONTEND=noninteractive",
            "TZ=Etc/UTC"
        ]
        inline = [
            "chmod -R 777 /support",
            "/support/standup.sh",
            "/support/enableSSH.sh",
            ""
        ]
    }

    provisioner "ansible" {
        playbook_file = "${local.provisioning}/configure_linux.yml"
        groups = ["linux"]
        extra_arguments = [
            "-e"
            ,"config=${var.CONFIG}"
            ,"-e"
            ,"kube_name=${var.NAME}"
            ,"-e"
            ,"kube_namespace=harness" 
            ,"-e"
            ,"kube_platform=linux"
            ,"-e"
            ,"image_registry_path=${var.IMAGE_REGISTRY_PATH}"
            ,"-e"
            ,"source_dir=${local.scripts}"
            ,"-e"
            ,"working_dir=${var.WORKING_DIR}"
        ]
    }

    post-processors {
        post-processor "docker-tag" {
            repository = "${var.IMAGE_REGISTRY_PATH}"
            tags = ["harness-delegate", "linux", "ubuntu20.04"]
        }
    }
}
