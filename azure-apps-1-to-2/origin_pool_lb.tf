resource "volterra_healthcheck" "example" {
  name      = format("%s-azure2-workload-1", var.projectPrefix)
  namespace = volterra_namespace.ns.name

  http_health_check {
    use_origin_server_name = true
    path                   = "/"
  }
  healthy_threshold   = 1
  interval            = 15
  timeout             = 1
  unhealthy_threshold = 2

  depends_on = [ volterra_namespace.ns ]
}

resource "volterra_origin_pool" "workload2" {
  name                   = format("%s-azure2-workload-1", var.projectPrefix)
  namespace              = volterra_namespace.ns.name
  endpoint_selection     = "DISTRIBUTED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  port                   = 8080
  no_tls                 = true

  origin_servers {
    private_ip {
      ip = var.workload_ip2a
      site_locator {
        site {
          namespace = "system"
          name      = format("%s-azure-2", var.projectPrefix)
        }
      }
    }
  }
  origin_servers {
    private_ip {
      ip = var.workload_ip2b
      site_locator {
        site {
          namespace = "system"
          name      = format("%s-azure-2", var.projectPrefix)
        }
      }
    }
  }
  origin_servers {
    private_ip {
      ip = var.workload_ip2c
      site_locator {
        site {
          namespace = "system"
          name      = format("%s-azure-2", var.projectPrefix)
        }
      }
    }
  }
  healthcheck {
    name = format("%s-azure2-workload-1", var.projectPrefix)
  }
  depends_on = [ volterra_namespace.ns ]
}

resource "volterra_http_loadbalancer" "workload2-to-1" {
  name                            = format("%s-azure-workload-2-to-1", var.projectPrefix)
  namespace                       = volterra_namespace.ns.name
  no_challenge                    = true
  domains                         = ["workload.azure2.example.internal"]

  disable_rate_limit              = true
  service_policies_from_namespace = true
  disable_waf                     = true

  advertise_custom {
    advertise_where {
      port = 80
      site {
        ### TODO should be variable
        ip = "100.64.15.254"      
        network = "SITE_NETWORK_INSIDE"
        site {
          name      = format("%s-azure-1", var.projectPrefix)
          namespace = "system"
        }
      }
    }
  }

  default_route_pools {
    pool {
      name = format("%s-azure2-workload-1", var.projectPrefix)
    }
    weight = 1
    priority = 1
  }

  http {
    dns_volterra_managed = false
  }
  depends_on = [ volterra_namespace.ns ]
}
