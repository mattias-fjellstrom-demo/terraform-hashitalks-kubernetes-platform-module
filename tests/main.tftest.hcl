variables {
    name_suffix = "hashitalks"
}

run "setup_resource_group" {
  variables {
    location    = "swedencentral"
  }

  module {
    source  = "app.terraform.io/mattias-fjellstrom/resource-group-module/hashitalks"
    version = "1.0.0"
  }
}

run "setup_virtual_network" {
  variables {
    resource_group = run.setup_resource_group.resource_group
    vnet_cidr_range = "10.0.0.0/16"
    subnets = [
      {
        name = "aks"
        subnet_cidr_range = "10.0.10.0/24"
      }
    ]
  }

  module {
    source  = "app.terraform.io/mattias-fjellstrom/resource-group-module/hashitalks"
    version = "1.0.0"
  }
}

run "setup_kubernetes_cluster" {
  variables {
    environment = "prod"
    resource_group = run.setup_resource_group.resource_group
    subnet = run.setup_virtual_network.subnets[0]
  }

  module {
    source  = "app.terraform.io/mattias-fjellstrom/resource-group-module/hashitalks"
    version = "1.0.0"
  }
}
