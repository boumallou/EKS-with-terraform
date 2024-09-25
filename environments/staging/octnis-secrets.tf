module "octnis_secrets_rds_proxy" {
  source        = "../../modules/secret-manager"
  secret_name   = "asia/${var.environment}/${var.octnis_app_name}-rds-proxy-1"
  secret_values = data.template_file.rds_proxy_secret_file.rendered
}

data "template_file" "rds_proxy_secret_file" {
  template = file("staging-rds-proxy.tpl")
  vars = {
    username            = var.staging_octnis_db_master_user
    password            = var.staging_octnis_db_master_password
    engine              = "postgres"
    port                = 5432
    host                = "${module.octnis-staging-rds.rds_endpoint}"
    dbClusterIdentifier = "${module.octnis-staging-rds.rds_cluster_identifier}"
  }
}


module "octnis_secrets" {
  source        = "../../modules/secret-manager"
  secret_name   = "asia/${var.environment}/${var.octnis_app_name}"
  secret_values = data.template_file.staging_secret_file.rendered
}

data "template_file" "staging_secret_file" {
  template = file("staging.tpl")
  vars = {
    rds-host                                    = "${module.rds_proxy.proxy_endpoint}"
    rds-user                                    = var.staging_octnis_db_master_user
    rds-password                                = var.staging_octnis_db_master_password
    redis-url                                   = "${module.octnis-staging-redis.primary_endpoint_address}"
    APRIL_MEGA_API_FULLERTON_KEY                = var.staging_APRIL_MEGA_API_FULLERTON_KEY
    APRIL_MEGA_API_IHP_KEY                      = var.staging_APRIL_MEGA_API_IHP_KEY
    NIS_PORTAL_TOKEN                            = var.staging_NIS_PORTAL_TOKEN
    NIS_PORTAL_TOKEN_SIGNATURE                  = var.staging_NIS_PORTAL_TOKEN_SIGNATURE
    NIS_PORTAL_TOKEN_PIN                        = var.staging_NIS_PORTAL_TOKEN_PIN
    NIS_GRAVITEE_AUTH_URL                       = var.staging_NIS_GRAVITEE_AUTH_URL
    NIS_GRAVITEE_USERNAME                       = var.staging_NIS_GRAVITEE_USERNAME
    NIS_GRAVITEE_PASSWORD                       = var.staging_NIS_GRAVITEE_PASSWORD
    GRAVITEE_CLIENT_SECRET                      = var.staging_GRAVITEE_CLIENT_SECRET
    GRAVITEE_CLIENT_ID                          = var.staging_GRAVITEE_CLIENT_ID
    GRAVITEE_ASIA_MEMBER_CLIENT_SECRET          = var.staging_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET
    GRAVITEE_ASIA_MEMBER_CLIENT_ID              = var.staging_GRAVITEE_ASIA_MEMBER_CLIENT_ID
    GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET = var.staging_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET
    GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID     = var.staging_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID
    DJANGO_SECRET_KEY                           = var.staging_DJANGO_SECRET_KEY
    NIS_APRIL_ON_CLIENT_ID                      = var.staging_NIS_APRIL_ON_CLIENT_ID
    NIS_APRIL_ON_CLIENT_SECRET                  = var.staging_NIS_APRIL_ON_CLIENT_SECRET
    GRAVITEE_CLEVA_CLIENT_ID                    = var.staging_GRAVITEE_CLEVA_CLIENT_ID
    GRAVITEE_CLEVA_CLIENT_SECRET                = var.staging_GRAVITEE_CLEVA_CLIENT_SECRET
    LIBERTYCOIN_COOKIE_AK_BMSC                  = var.staging_LIBERTYCOIN_COOKIE_AK_BMSC
    IPGPAY_CLIENT_ID                            = var.staging_IPGPAY_CLIENT_ID
    IPGPAY_FORM_ID                              = var.staging_IPGPAY_FORM_ID
    BANK_SUITE_API_KEY                          = var.staging_BANK_SUITE_API_KEY
    BAYMAX_CLIENT_ID                            = var.staging_BAYMAX_CLIENT_ID
    SALESFORCE_CLIENT_ID                        = var.staging_SALESFORCE_CLIENT_ID
    SALESFORCE_CLIENT_SECRET                    = var.staging_SALESFORCE_CLIENT_SECRET
    SALESFORCE_PASSWORD                         = var.staging_SALESFORCE_PASSWORD
    SALESFORCE_SALES_CHATTER_ID                 = var.staging_SALESFORCE_SALES_CHATTER_ID
    BAYMAX_EU_CLIENT_ID                         = var.staging_BAYMAX_EU_CLIENT_ID
    GRAVITEE_PAYMENT_CLIENT_ID                  = var.staging_GRAVITEE_PAYMENT_CLIENT_ID
    GRAVITEE_PAYMENT_CLIENT_SECRET              = var.staging_GRAVITEE_PAYMENT_CLIENT_SECRET
  }
}
