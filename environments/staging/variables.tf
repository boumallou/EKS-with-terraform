variable "environment" {
  type = string
}
variable bucketnames {
    type = list
}

variable "octnis_app_name" {
   type = string
}
variable "baymax_app_name" {
   type = string
}
variable "octnis_instance_size" {
   type = string
}
variable "baymax_instance_size" {
   type = string
}
variable "octnis_key_name" {
  type = string
}
variable "baymax_key_name" {
  type = string
}
variable "octnis_certificat_arn" {
  type = string
}

#Octnis record name
variable "Octnis_record_name"{
   type = string
}
#Octnis EKS cluster namerecord name
variable "Octnis_eks_cluster_name"{
   type = string
}

variable "staging_octnis_db_master_user" {
  type = string
  sensitive   = true
}
variable "staging_octnis_db_master_password" {
  type = string
  sensitive   = true
}
variable "staging_APRIL_MEGA_API_FULLERTON_KEY" {
  type = string
  sensitive   = true
}
variable "staging_APRIL_MEGA_API_IHP_KEY" {
  type = string
  sensitive   = true
}
variable "staging_NIS_PORTAL_TOKEN" {
  type = string
  sensitive   = true
}
variable "staging_NIS_PORTAL_TOKEN_SIGNATURE" {
  type = string
  sensitive   = true
}
variable "staging_NIS_PORTAL_TOKEN_PIN" {
  type = string
  sensitive   = true
}
variable "staging_NIS_GRAVITEE_USERNAME" {
  type = string
  sensitive   = true
}
variable "staging_NIS_GRAVITEE_PASSWORD" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_CLIENT_SECRET" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_ASIA_MEMBER_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_DJANGO_SECRET_KEY" {
  type = string
  sensitive   = true
}
variable "staging_NIS_APRIL_ON_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_NIS_APRIL_ON_CLIENT_SECRET" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_CLEVA_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_GRAVITEE_CLEVA_CLIENT_SECRET" {
  type = string
  sensitive   = true
}
variable "staging_LIBERTYCOIN_COOKIE_AK_BMSC" {
  type = string
  sensitive   = true
}
variable "staging_IPGPAY_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_IPGPAY_FORM_ID" {
  type = string
  sensitive   = true
}
variable "staging_BANK_SUITE_API_KEY" {
  type = string
  sensitive   = true
}
variable "staging_BAYMAX_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_SALESFORCE_CLIENT_ID" {
  type = string
  sensitive   = true
}
variable "staging_SALESFORCE_CLIENT_SECRET" {
  type = string
  sensitive   = true
}
variable "staging_SALESFORCE_PASSWORD" {
  type = string
  sensitive   = true
}
variable "staging_NIS_GRAVITEE_AUTH_URL" {
  type = string
}

variable "staging_SALESFORCE_SALES_CHATTER_ID" {
  type = string
  sensitive   = true
}

variable "staging_BAYMAX_EU_CLIENT_ID" {
  type = string
  sensitive   = true
}

variable "staging_GRAVITEE_PAYMENT_CLIENT_ID" {
  type = string
  sensitive   = true
}

variable "staging_GRAVITEE_PAYMENT_CLIENT_SECRET" {
  type = string
  sensitive   = true
}