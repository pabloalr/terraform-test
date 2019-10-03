provider "openstack" {
  user_name     = var.provider_username
  auth_url      = "http://10.10.0.12:5000/v3/"
  tenant_name   = "mailee"
  project_domain_name = "Default"
  password      = var.provider_password
  region        = "SPO1"

#  endpoint_overrides = {
#    "compute"   = "http://10.10.0.12:8774/v2.1"
#    "identity"  = "http://10.10.0.12:5000/v3/"
#    "image"     = "http://10.10.0.12:9292"
#    "placement" = "http://10.10.0.12:8778"
#    "volumev2"  = "http://10.10.0.12:8776/v2/672a6ae7972a460a8471717644668724"
#    "volumev3"  = "http://10.10.0.12:8776/v3/672a6ae7972a460a8471717644668724"
#  }
}
