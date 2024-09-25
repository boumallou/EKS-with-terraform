variable "environment" {
  type = string
}
variable "bucketnames" {
  type = list(any)
}

variable "octnis_app_name" {
  type = string
}

variable "octnis_certificat_arn" {
  type = string
}


variable "Octnis_eks_cluster_name" {
  type = string
}

variable "Octnis_eks_cluster_name-eu" {
  type = string
}

variable "preprod_octnis_db_master_user" {
  type      = string
  sensitive = true
}
variable "preprod_octnis_db_master_password" {
  type      = string
  sensitive = true
}
variable "preprod_APRIL_MEGA_API_FULLERTON_KEY" {
  type      = string
  sensitive = true
}
variable "preprod_APRIL_MEGA_API_IHP_KEY" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_PORTAL_TOKEN" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_PORTAL_TOKEN_SIGNATURE" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_PORTAL_TOKEN_PIN" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_GRAVITEE_USERNAME" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_GRAVITEE_PASSWORD" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_CLIENT_SECRET" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_ASIA_MEMBER_CLIENT_SECRET" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_ASIA_MEMBER_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_SECRET" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_ASIA_BUSINESS_MEMBER_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_DJANGO_SECRET_KEY" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_APRIL_ON_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_NIS_APRIL_ON_CLIENT_SECRET" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_CLEVA_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_GRAVITEE_CLEVA_CLIENT_SECRET" {
  type      = string
  sensitive = true
}
variable "preprod_LIBERTYCOIN_COOKIE_AK_BMSC" {
  type      = string
  sensitive = true
}
variable "preprod_IPGPAY_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_IPGPAY_FORM_ID" {
  type      = string
  sensitive = true
}

variable "preprod_SALESFORCE_GRANT_TYPE" {
  type      = string
  sensitive = true
}
variable "preprod_SALESFORCE_CLIENT_ID" {
  type      = string
  sensitive = true
}
variable "preprod_SALESFORCE_CLIENT_SECRET" {
  type      = string
  sensitive = true
}
variable "preprod_SALESFORCE_USERNAME" {
  type      = string
  sensitive = true
}
variable "preprod_SALESFORCE_PASSWORD" {
  type      = string
  sensitive = true
}
variable "preprod_SALESFORCE_SALES_CHATTER_ID" {
  type      = string
  sensitive = true
}
variable "preprod_BANK_SUITE_API_KEY" {
  type      = string
  sensitive = true
}

variable "preprod_NIS_GRAVITEE_AUTH_URL" {
  type      = string
}

variable "preprod_BAYMAX_EU_CLIENT_ID" {
  type      = string
  sensitive = true
}

variable "preprod_GRAVITEE_PAYMENT_CLIENT_ID" {
  type      = string
  sensitive = true
}

variable "preprod_GRAVITEE_PAYMENT_CLIENT_SECRET" {
  type      = string
  sensitive = true
}

variable "preprod_BAYMAX_EU_APRIL_CLIENT_ID" {
  type      = string
  sensitive = true
}

variable "preprod_BAYMAX_EU_APRIL_CLIENT_SECRET" {
  type      = string
  sensitive = true
}