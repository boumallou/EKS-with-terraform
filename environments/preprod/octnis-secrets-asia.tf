# module "octnis_secrets" {
#   source        = "../../modules/secret-manager"
#   secret_name   = "asia/${var.environment}/${var.octnis_app_name}"
#   secret_values = templatefile("preprod.tpl", { 
#                                               aws-region = "ap-southeast-1",
#                                               rds-host = "${module.octnis-preprod-rds.rds_endpoint}",
#                                               rds-user                                    = var.preprod_octnis_db_master_user,
#                                               rds-password                                = var.preprod_octnis_db_master_password,
#                                               redis-url                                   = "${module.octnis-preprod-redis.primary_endpoint_address}",
#                                               APRIL_MEGA_API_FULLERTON_KEY                = var.preprod_APRIL_MEGA_API_FULLERTON_KEY,
#                                               APRIL_MEGA_API_IHP_KEY                      = var.preprod_APRIL_MEGA_API_IHP_KEY,
#                                               NIS_PORTAL_TOKEN                            = var.preprod_NIS_PORTAL_TOKEN,
#                                               NIS_PORTAL_TOKEN_SIGNATURE                  = var.preprod_NIS_PORTAL_TOKEN_SIGNATURE,
#                                               NIS_PORTAL_TOKEN_PIN                        = var.preprod_NIS_PORTAL_TOKEN_PIN,
#                                               NIS_GRAVITEE_USERNAME                       = var.preprod_NIS_GRAVITEE_USERNAME,
#                                               NIS_GRAVITEE_PASSWORD                       = var.preprod_NIS_GRAVITEE_PASSWORD,
#                                               GRAVITEE_CLIENT_SECRET                      = var.preprod_GRAVITEE_CLIENT_SECRET,
#                                               GRAVITEE_CLIENT_ID                          = var.preprod_GRAVITEE_CLIENT_ID,
#                                               GRAVITEE_ASIA_MEMBER_CLIENT_SECRET          = var.preprod_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET,
#                                               GRAVITEE_ASIA_MEMBER_CLIENT_ID              = var.preprod_GRAVITEE_ASIA_MEMBER_CLIENT_ID,
#                                               GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET = var.preprod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET,
#                                               GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID     = var.preprod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID,
#                                               DJANGO_SECRET_KEY                           = var.preprod_DJANGO_SECRET_KEY,
#                                               NIS_APRIL_ON_CLIENT_ID                      = var.preprod_NIS_APRIL_ON_CLIENT_ID,
#                                               NIS_APRIL_ON_CLIENT_SECRET                  = var.preprod_NIS_APRIL_ON_CLIENT_SECRET,
#                                               GRAVITEE_CLEVA_CLIENT_ID                    = var.preprod_GRAVITEE_CLEVA_CLIENT_ID,
#                                               GRAVITEE_CLEVA_CLIENT_SECRET                = var.preprod_GRAVITEE_CLEVA_CLIENT_SECRET,
#                                               LIBERTYCOIN_COOKIE_AK_BMSC                  = var.preprod_LIBERTYCOIN_COOKIE_AK_BMSC,
#                                               IPGPAY_CLIENT_ID                            = var.preprod_IPGPAY_CLIENT_ID,
#                                               IPGPAY_FORM_ID                              = var.preprod_IPGPAY_FORM_ID,
#                                               SALESFORCE_GRANT_TYPE                       = var.preprod_SALESFORCE_GRANT_TYPE,
#                                               SALESFORCE_CLIENT_ID                        = var.preprod_SALESFORCE_CLIENT_ID,
#                                               SALESFORCE_CLIENT_SECRET                    = var.preprod_SALESFORCE_CLIENT_SECRET,
#                                               SALESFORCE_USERNAME                         = var.preprod_SALESFORCE_USERNAME,
#                                               SALESFORCE_PASSWORD                         = var.preprod_SALESFORCE_PASSWORD,
#                                               SALESFORCE_SALES_CHATTER_ID                 = var.preprod_SALESFORCE_SALES_CHATTER_ID,
#                                               BANK_SUITE_API_KEY                          = var.preprod_BANK_SUITE_API_KEY,
#                                               BAYMAX_CLIENT_ID                            = var.preprod_BAYMAX_CLIENT_ID
#   })
# }


