provider "google" {
  region  = "${var.region}"
  project = "${var.project}"
}

provider "google-beta" {
  region  = "${var.region}"
  project = "${var.project}"
}

module "bootstrap" {
  source = "github.com/cneralich/private-terraform-enterprise//examples/bootstrap-google"

  project = "${var.project}"
  creds   = "${var.credentials_file}"
  domain  = "${var.domain}"
  dnszone = "${var.dns_zone}"

  postgresql_machinetype = "${var.postgresql_machinetype}"
  postgresql_password = "${var.postgresql_password}"
  postgresql_dbname = "${var.postgresql_dbname}"
}

module "tfe-deploy" {
  source           = "hashicorp/terraform-enterprise/google"
  version          = "0.1.1"
  credentials_file = "${var.credentials_file}"
  region           = "${var.region}"
  zone             = "${var.region}-a"
  project          = "${var.project}"
  domain           = "${var.domain}"
  dns_zone         = "${module.bootstrap.dns_zone}"
  public_ip        = "${module.bootstrap.FrondEnd_IP}"
  certificate      = "${module.bootstrap.Certificate}"
  ssl_policy       = "${module.bootstrap.SSL_Policy}"
  subnet           = "${module.bootstrap.subnet}"
  frontend_dns     = "${var.frontend_dns}"

  gcs_bucket = "${module.bootstrap.storage_bucket}"

  #gcs_credentials  = "${var.credentials_file}"
  #gcs_project      = "${var.project}"

  postgresql_address  = "${module.bootstrap.psql_db_ip_address}"
  postgresql_database = "${var.postgresql_dbname}"
  #postgresql_extra_params = ""
  postgresql_user     = "${module.bootstrap.psql_dbuser}"
  postgresql_password = "${base64encode("${var.postgresql_password}")}"

  primary_count   = "${var.primary_count}"
  secondary_count = "${var.secondary_count}"
  license_file = "${var.license_file}"
}
