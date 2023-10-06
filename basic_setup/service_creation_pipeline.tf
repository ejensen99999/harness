locals {
    identifier = "Deploy_Sample_Pipeline"
    org_id = "orgIdentifier"
    project_id = "projectIdentifier"
    name = "Onboarding Service"
}


resource "harness_platform_pipeline" "example" {
  identifier = local.identifier
  org_id     = local.org_id
  project_id = harness_platform_project.cdproject.id
  name       = local.name
  git_details {
    branch_name    = "main"
    commit_message = "commitMessage"
    file_path      = "filePath"
    connector_ref  = "connectorRef"
    store_type     = "REMOTE"
    repo_name      = "repoName"
  }

  yaml = <<-EOT
                pipeline:
                name: ${local.name}
                identifier: ${local.identifier}
                projectIdentifier: ${local.project_id}
                orgIdentifier: ${local.org_id}
                tags: {}
                stages:
                    - stage:
                        name: Create and Update Service
                        identifier: Create_and_Update_Service
                        description: Create and update a service from Github
                        type: Custom
                        spec:
                        execution:
                            steps:
                            - step:
                                type: TerraformPlan
                                name: Service Create and Update Plan
                                identifier: Service_Create_and_Update_Plan
                                spec:
                                    configuration:
                                    command: Apply
                                    configFiles:
                                        store:
                                        type: Github
                                        spec:
                                            gitFetchType: Branch
                                            connectorRef: ProductManagementRohan
                                            branch: main
                                            folderPath: service/nginx.tf
                                            repoName: harness
                                        moduleSource:
                                        useConnectorCredentials: true
                                    secretManagerRef: harnessSecretManager
                                    provisionerIdentifier: service
                                timeout: 10m
                            - step:
                                type: TerraformApply
                                name: Create and Update Service
                                identifier: Create_and_Update_Service
                                spec:
                                    configuration:
                                    type: InheritFromPlan
                                    provisionerIdentifier: service
                                timeout: 10m
                        tags: {}
                description: This Pipeline is dedicated to onboarding services in Harness


  EOT
}