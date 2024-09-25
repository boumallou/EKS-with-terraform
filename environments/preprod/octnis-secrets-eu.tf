module "octnis_secrets_rds_proxy" {
  source = "../../modules/secret-manager"
  providers = {
    aws = aws.Paris
  }
  secret_name   = "eu/${var.environment}/${var.octnis_app_name}-rds-proxy-1"
  secret_values = data.template_file.rds_proxy_secret_file.rendered
}

data "template_file" "rds_proxy_secret_file" {
  template = file("preprod-rds-proxy.tpl")
  vars = {
    username            = var.preprod_octnis_db_master_user
    password            = var.preprod_octnis_db_master_password
    engine              = "postgres"
    port                = 5432
    host                = "${module.octnis-preprod-rds-eu.rds_endpoint}",
    dbClusterIdentifier = "${module.octnis-preprod-rds-eu.rds_cluster_identifier}"
  }
}

module "octnis_secrets-eu" {
  source = "../../modules/secret-manager"
  providers = {
    aws = aws.Paris
  }
  secret_name = "eu/${var.environment}/${var.octnis_app_name}"
  secret_values = templatefile("preprod.tpl", {
    aws-region                                  = "eu-west-3",
    rds-host                                    = "${module.rds_proxy.proxy_endpoint}",
    rds-user                                    = var.preprod_octnis_db_master_user,
    rds-password                                = var.preprod_octnis_db_master_password,
    redis-url                                   = "${module.octnis-preprod-redis-eu.primary_endpoint_address}",
    APRIL_MEGA_API_FULLERTON_KEY                = var.preprod_APRIL_MEGA_API_FULLERTON_KEY,
    APRIL_MEGA_API_IHP_KEY                      = var.preprod_APRIL_MEGA_API_IHP_KEY,
    NIS_PORTAL_TOKEN                            = var.preprod_NIS_PORTAL_TOKEN,
    NIS_PORTAL_TOKEN_SIGNATURE                  = var.preprod_NIS_PORTAL_TOKEN_SIGNATURE,
    NIS_PORTAL_TOKEN_PIN                        = var.preprod_NIS_PORTAL_TOKEN_PIN,
    NIS_GRAVITEE_AUTH_URL                       = var.preprod_NIS_GRAVITEE_AUTH_URL,
    NIS_GRAVITEE_USERNAME                       = var.preprod_NIS_GRAVITEE_USERNAME,
    NIS_GRAVITEE_PASSWORD                       = var.preprod_NIS_GRAVITEE_PASSWORD,
    GRAVITEE_CLIENT_SECRET                      = var.preprod_GRAVITEE_CLIENT_SECRET,
    GRAVITEE_CLIENT_ID                          = var.preprod_GRAVITEE_CLIENT_ID,
    GRAVITEE_ASIA_MEMBER_CLIENT_SECRET          = var.preprod_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET,
    GRAVITEE_ASIA_MEMBER_CLIENT_ID              = var.preprod_GRAVITEE_ASIA_MEMBER_CLIENT_ID,
    GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET = var.preprod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET,
    GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID     = var.preprod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID,
    DJANGO_SECRET_KEY                           = var.preprod_DJANGO_SECRET_KEY,
    NIS_APRIL_ON_CLIENT_ID                      = var.preprod_NIS_APRIL_ON_CLIENT_ID,
    NIS_APRIL_ON_CLIENT_SECRET                  = var.preprod_NIS_APRIL_ON_CLIENT_SECRET,
    GRAVITEE_CLEVA_CLIENT_ID                    = var.preprod_GRAVITEE_CLEVA_CLIENT_ID,
    GRAVITEE_CLEVA_CLIENT_SECRET                = var.preprod_GRAVITEE_CLEVA_CLIENT_SECRET,
    LIBERTYCOIN_COOKIE_AK_BMSC                  = var.preprod_LIBERTYCOIN_COOKIE_AK_BMSC,
    IPGPAY_CLIENT_ID                            = var.preprod_IPGPAY_CLIENT_ID,
    IPGPAY_FORM_ID                              = var.preprod_IPGPAY_FORM_ID,
    SALESFORCE_GRANT_TYPE                       = var.preprod_SALESFORCE_GRANT_TYPE,
    SALESFORCE_CLIENT_ID                        = var.preprod_SALESFORCE_CLIENT_ID,
    SALESFORCE_CLIENT_SECRET                    = var.preprod_SALESFORCE_CLIENT_SECRET,
    SALESFORCE_USERNAME                         = var.preprod_SALESFORCE_USERNAME,
    SALESFORCE_PASSWORD                         = var.preprod_SALESFORCE_PASSWORD,
    SALESFORCE_SALES_CHATTER_ID                 = var.preprod_SALESFORCE_SALES_CHATTER_ID,
    BANK_SUITE_API_KEY                          = var.preprod_BANK_SUITE_API_KEY,
    BAYMAX_EU_CLIENT_ID                         = var.preprod_BAYMAX_EU_CLIENT_ID,
    GRAVITEE_PAYMENT_CLIENT_ID                  = var.preprod_GRAVITEE_PAYMENT_CLIENT_ID,
    GRAVITEE_PAYMENT_CLIENT_SECRET              = var.preprod_GRAVITEE_PAYMENT_CLIENT_SECRET,
    BAYMAX_EU_APRIL_CLIENT_ID                   = var.preprod_BAYMAX_EU_APRIL_CLIENT_ID,
    BAYMAX_EU_APRIL_CLIENT_SECRET               = var.preprod_BAYMAX_EU_APRIL_CLIENT_SECRET,
  })
}
