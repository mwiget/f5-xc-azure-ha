locals {
    auto_trusted_cidr = ["${jsondecode(data.http.myip[0].body).ip}/32"]
    trusted_cidr = concat([var.servicesVnetAddressSpace],local.auto_trusted_cidr)
}

data http myip {
  count = 1
  url   = "https://ipinfo.io"
}
