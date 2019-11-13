output "tfe-deploy" {
  value = {
    application_endpoint         = "${module.tfe-deploy.application_endpoint}"
    application_health_check     = "${module.tfe-deploy.application_health_check}"
    installer_dashboard_password = "${module.tfe-deploy.installer_dashboard_password}"
    installer_dashboard_url      = "${module.tfe-deploy.installer_dashboard_url}"
    primary_public_ip            = "${module.tfe-deploy.primary_public_ip}"
  }
}
