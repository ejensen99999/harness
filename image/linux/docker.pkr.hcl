variable "CONFIG" { type = string }
variable "EMAIL" { type = string }
variable "NAME" {  type = string }
variable "SOURCE_DIR" { type = string }
variable "TAG" { default = "harness"}
variable "IMAGE_REGISTRY_PATH" { type = string }
variable "LOGIN_USER" { type = string }
variable "LOGIN_PASS" { sensitive = true }

variable "ansible_connection" { default = "docker" }

locals {
  provisioning  = "${path.root}/../ansible"
  support_folder = "${path.root}/support"
  scripts = "${var.SOURCE_DIR}/configs"
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
    image = "ejensen99999/minimal_ubuntu_base:latest"
    commit = true
    run_command = ["-d", "-i", "-t", "--entrypoint=/bin/bash", "--", "{{.Image}}"]
    changes = [
        "ENV TARGETARCH amd64",
        "USER 1001",
        "CMD [\"./start.sh\"]"
    ]
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
            
        ]
    }

    provisioner "ansible" {
        playbook_file = "${local.provisioning}/configure_linux.yml"
        groups = ["linux"]
        use_proxy = false
        extra_arguments = ["-vvv",
            "-e",
            "config=${var.CONFIG}",
            "-e",
            "kube_name=${var.NAME}",
            "-e",
            "kube_namespace=harness" ,
            "-e",
            "kube_platform=linux",
            "-e",
            "image_registry_path=${var.IMAGE_REGISTRY_PATH}",
            "-e",
            "source_dir=${var.SOURCE_DIR}"
        ]
    }

    post-processors {
        post-processor "docker-tag" {
            repository = "${var.IMAGE_REGISTRY_PATH}/${var.NAME}"
            tags = [var.TAG]
        }

        post-processor "docker-push" {
            login = true
            login_username = var.LOGIN_USER
            login_password = var.LOGIN_PASS
        }
    }
}
