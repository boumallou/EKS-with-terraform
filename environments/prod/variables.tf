variable "environment" {
  type = string
}
variable bucketnames {
    type = list
}
variable "octnis_app_name" {
  type = string
}
variable "april_asia_certificat_arn" {
  type = string
}
variable "april_international_certificat_arn" {
  type = string
}
variable "Managed-CachingOptimized-policy" {
  type = string
}
variable "uexglobal_com_certificat_arn" {
  type = string
}
variable "uex-tech_certificat_arn" {
  type = string
}
variable "masante_april-entreprise_certificat_arn" {
  type = string
}
variable "prod_octnis_db_master_user_eu" {
  type      = string
  sensitive = true
}
variable "prod_octnis_db_master_password_eu" {
  type      = string
  sensitive = true
}
variable "prod_APRIL_MEGA_API_FULLERTON_KEY_eu" {
  type      = string
  sensitive = true
}
variable "prod_APRIL_MEGA_API_IHP_KEY_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_PORTAL_TOKEN_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_PORTAL_TOKEN_SIGNATURE_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_PORTAL_TOKEN_PIN_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_GRAVITEE_USERNAME_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_GRAVITEE_PASSWORD_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_ASIA_MEMBER_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_DJANGO_SECRET_KEY_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_APRIL_ON_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_NIS_APRIL_ON_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_CLEVA_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_CLEVA_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "prod_LIBERTYCOIN_COOKIE_AK_BMSC_eu" {
  type      = string
  sensitive = true
}
variable "prod_IPGPAY_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_IPGPAY_FORM_ID_eu" {
  type      = string
  sensitive = true
}

variable "prod_SALESFORCE_GRANT_TYPE_eu" {
  type      = string
  sensitive = true
}
variable "prod_SALESFORCE_ASIA_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_SALESFORCE_ASIA_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "prod_SALESFORCE_USERNAME_eu" {
  type      = string
  sensitive = true
}
variable "prod_SALESFORCE_PASSWORD_eu" {
  type      = string
  sensitive = true
}
variable "prod_SALESFORCE_ASIA_SALES_CHATTER_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_BANK_SUITE_API_KEY_eu" {
  type      = string
  sensitive = true
}

variable "prod_BAYMAX_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}

variable "prod_GRAVITEE_PAYMENT_CLIENT_ID_eu" {
  type      = string
  sensitive = true
}
variable "prod_GRAVITEE_PAYMENT_CLIENT_SECRET_eu" {
  type      = string
  sensitive = true
}
variable "Octnis_eks_cluster_name" {
  type      = string
}
variable "Octnis_eks_cluster_name-eu" {
  type      = string
}