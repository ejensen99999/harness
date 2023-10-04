locals {
    identifier = "devk8s"
    org_id = "default"
    project_id = "cdproduct"
    name = "devk8s"
    env_id = "dev"
}

resource "harness_platform_infrastructure" "infrastructure" {
  identifier      = local.identifier
  name            = local.name
  org_id          = local.org_id
  project_id      = local.project_id
  env_id          = local.env_id
  type            = "KubernetesDirect"
  deployment_type = "Kubernetes"
  yaml            = <<-EOT
        infrastructureDefinition:
         name: ${local.name}
         identifier: ${local.identifier}
         description: "development kubernetes cluster"
         tags:
           owner: "devops"
         orgIdentifier: ${local.org_id}
         projectIdentifier: ${local.project_id}
         environmentRef: ${local.env_id}
         deploymentType: Kubernetes
         type: KubernetesDirect
         spec:
          connectorRef: devkubernetes ### Replace with your connector
          namespace: ${local.env_id}
          releaseName: release-<+INFRA_KEY>
          allowSimultaneousDeployments: false
      EOT
}