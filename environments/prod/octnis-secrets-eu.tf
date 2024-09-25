module "octnis_secrets_rds_proxy-eu" {
  source = "../../modules/secret-manager"
  providers = {
    aws = aws.Paris
  }
  secret_name   = "eu/${var.environment}/${var.octnis_app_name}-rds-proxy-1"
  secret_values = templatefile("prod-rds-proxy.tpl", { 
    username            = var.prod_octnis_db_master_user_eu
    password            = var.prod_octnis_db_master_password_eu
    engine              = "postgres"
    port                = 5432
    host                = "${module.octnis-prod-rds-eu.rds_endpoint}",
    dbClusterIdentifier = "${module.octnis-prod-rds-eu.rds_cluster_identifier}"
  })
}


module "octnis_secrets-eu" {
  source        = "../../modules/secret-manager"
  providers = {
     aws = aws.Paris
   }
  secret_name   = "eu/${var.environment}/${var.octnis_app_name}"
  secret_values = templatefile("prod-eu.tpl", { 
                                              aws-region = "eu-west-3",
                                              rds-host                                    = "${module.octnis-prod-rds-eu.rds_endpoint}",
                                              rds-user                                    = var.prod_octnis_db_master_user_eu,
                                              rds-password                                = var.prod_octnis_db_master_password_eu,
                                              redis-url                                   = "${module.octnis-prod-redis-eu.primary_endpoint_address}",
                                              APRIL_MEGA_API_FULLERTON_KEY                = var.prod_APRIL_MEGA_API_FULLERTON_KEY_eu,
                                              APRIL_MEGA_API_IHP_KEY                      = var.prod_APRIL_MEGA_API_IHP_KEY_eu,
                                              BANK_SUITE_API_KEY                          = var.prod_BANK_SUITE_API_KEY_eu,
                                              BAYMAX_CLIENT_ID                            = var.prod_BAYMAX_CLIENT_ID_eu,
                                              DJANGO_SECRET_KEY                           = var.prod_DJANGO_SECRET_KEY_eu,
                                              GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID     = var.prod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID_eu,
                                              GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET = var.prod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET_eu,
                                              GRAVITEE_ASIA_MEMBER_CLIENT_ID              = var.prod_GRAVITEE_ASIA_MEMBER_CLIENT_ID_eu,
                                              GRAVITEE_ASIA_MEMBER_CLIENT_SECRET          = var.prod_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET_eu,
                                              GRAVITEE_CLEVA_CLIENT_ID                    = var.prod_GRAVITEE_CLEVA_CLIENT_ID_eu,
                                              GRAVITEE_CLEVA_CLIENT_SECRET                = var.prod_GRAVITEE_CLEVA_CLIENT_SECRET_eu,
                                              GRAVITEE_CLIENT_ID                          = var.prod_GRAVITEE_CLIENT_ID_eu,
                                              GRAVITEE_CLIENT_SECRET                      = var.prod_GRAVITEE_CLIENT_SECRET_eu,
                                              IPGPAY_CLIENT_ID                            = var.prod_IPGPAY_CLIENT_ID_eu,
                                              IPGPAY_FORM_ID                              = var.prod_IPGPAY_FORM_ID_eu,
                                              LIBERTYCOIN_COOKIE_AK_BMSC                  = var.prod_LIBERTYCOIN_COOKIE_AK_BMSC_eu,
                                              NIS_APRIL_ON_CLIENT_ID                      = var.prod_NIS_APRIL_ON_CLIENT_ID_eu,
                                              NIS_APRIL_ON_CLIENT_SECRET                  = var.prod_NIS_APRIL_ON_CLIENT_SECRET_eu,
                                              NIS_GRAVITEE_PASSWORD                       = var.prod_NIS_GRAVITEE_PASSWORD_eu,
                                              NIS_GRAVITEE_USERNAME                       = var.prod_NIS_GRAVITEE_USERNAME_eu,
                                              NIS_PORTAL_TOKEN                            = var.prod_NIS_PORTAL_TOKEN_eu,
                                              NIS_PORTAL_TOKEN_PIN                        = var.prod_NIS_PORTAL_TOKEN_PIN_eu, 
                                              NIS_PORTAL_TOKEN_SIGNATURE                  = var.prod_NIS_PORTAL_TOKEN_SIGNATURE_eu,
                                              SALESFORCE_ASIA_CLIENT_ID                   = var.prod_SALESFORCE_ASIA_CLIENT_ID_eu,
                                              SALESFORCE_ASIA_CLIENT_SECRET               = var.prod_SALESFORCE_ASIA_CLIENT_SECRET_eu,
                                              SALESFORCE_GRANT_TYPE                       = var.prod_SALESFORCE_GRANT_TYPE_eu,
                                              SALESFORCE_PASSWORD                         = var.prod_SALESFORCE_PASSWORD_eu,
                                              SALESFORCE_ASIA_SALES_CHATTER_ID            = var.prod_SALESFORCE_ASIA_SALES_CHATTER_ID_eu,
                                              SALESFORCE_USERNAME                         = var.prod_SALESFORCE_USERNAME_eu,
                                              GRAVITEE_PAYMENT_CLIENT_ID                  = var.prod_GRAVITEE_PAYMENT_CLIENT_ID_eu,
                                              GRAVITEE_PAYMENT_CLIENT_SECRET              = var.prod_GRAVITEE_PAYMENT_CLIENT_SECRET_eu
                                                                                        
  })
}
