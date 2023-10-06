locals {
    identifier = "dev"
    org_id = "default"
    name = "dev"
}

resource "harness_platform_environment" "dev_default_cdproject" {
  identifier = local.identifier ## Define Environment Identifier, this is unique to the project, org or account - where the environment will be created
  name       = local.name ## This will be the name of the environment that you will see in Harness UI
  org_id     = local.org_id ## Optional if you're creating at Account level
  project_id = harness_platform_project.cdproject.id ## optional if you're creating at Org or Acount
  tags       = ["status:nonregulated", "owner:devops"]
  type       = "PreProduction"
  yaml = <<-EOT
    environment:
         name:${local.name} ## Name of the environment, similar to above
         identifier: ${local.identifier} ## Name of the environment
         orgIdentifier: ${local.org_id}  
         projectIdentifier: ${harness_platform_project.cdproject.id} ## optional if your creating at Org or Acount, this is where the environment will be created
         type: PreProduction
         tags:
           status: nonregulated
           owner: devops
         variables: ## You can configure global environment variable overides here
           - name: port
             type: String
             value: 8080
             description: "Default Port for Dev Environment"
           - name: db_url
             type: String
             value: "https://postrges:8080"
             description: "postgress url"
         overrides: ## You can configure global environment overrides here
           manifests:
             - manifest:
                 identifier: valuesDev
                 type: Values
                 spec:
                   store:
                     type: Git
                     spec:
                       connectorRef: <+input>
                       gitFetchType: Branch
                       paths:
                         - /dev/dev-values.yaml
                       repoName: <+input>
                       branch: master
           configFiles: ## You can configure configuration file overrides here.
             - configFile:
                 identifier: configFileEnv
                 spec:
                   store:
                     type: Harness
                     spec:
                       files:
                         - account:/Add-ons/svcOverrideTest
                       secretFiles: []
      EOT
}