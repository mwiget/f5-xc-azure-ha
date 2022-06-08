include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../base-azure-region-1"]
}

dependency "infrastructure" {
  config_path = "../base-azure-region-1"
}

inputs = {
    resourceGroup = dependency.infrastructure.outputs.resourceGroup
    hubVnetName   = dependency.infrastructure.outputs.hubVnetName
}

