packer {
    required_plugins {
        docker = {
            version = ">= 1.0.5"
            source = "github.com/hashicorp/docker"
        }
    }
}

source "docker" "coldstone-linux" {
    image = "ubuntu:20.04"
    commit = true
    changes = [
        "WORKDIR ${var.WORKING_DIR}",
        "EXPOSE 22",
        "ENV GITHUB_PAT ${var.GITHUB_PAT}",
        "ENV GITHUB_OWNER ${var.GITHUB_OWNER}",
        "ENV GITHUB_INSTALL ${var.GITHUB_INSTALL}",
        "ENV GITHUB_DOWNLOAD ${var.GITHUB_DOWNLOAD}",
        "ENV GITHUB_REPOSITORY ${var.GITHUB_REPOSITORY}",
        "ENV RUNNER_DIR ${var.RUNNER_DIR}",
        "ENV RUNNER_EPHEMERAL ${var.RUNNER_EPHEMERAL}",
        "ENV RUNNER_LABELS coldstone,${var.NAME}",
        "ENV RUNNER_NAME ${var.NAME}",
        "ENV RUNNER_ORG ${var.GITHUB_OWNER}",
        "ENV RUNNER_WORKDIR _work",
        "VOLUME /var/lib/docker", 
        "USER runner",
        "ENTRYPOINT [\"/usr/local/bin/dumb-init\", \"--\"]",
        "CMD [\"startup.sh\"]"
    ]
}

build { 
    name = "base"
    sources = ["sources.docker.coldstone-linux"]

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
            "/support/addUser.sh",
            "/support/enableSSH.sh"
        ]
    }

    provisioner "ansible" {
        playbook_file = "${local.provisioning}/configure_linux.yml"
        groups = ["linux"]
        extra_arguments = [
            "--extra-vars", "config=${var.CONFIG} kube_name=${var.NAME} kube_namespace=${var.GITHUB_OWNER} kube_platform=linux image_registry_path=${var.IMAGE_REGISTRY_PATH} source_dir=${var.SOURCE_REPO} working_dir=${var.WORKING_DIR}"
        ]
    }

    post-processors {
        post-processor "docker-tag" {
            repository = "${var.IMAGE_REGISTRY_PATH}"
            tags = ["coldstone", "linux", "ubuntu20.04"]
        }
    }
}
