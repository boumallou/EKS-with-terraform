resource "aws_cognito_user_pool" "user_pool" {
  name              = "octnis-user-pool"
  mfa_configuration = "ON"
  software_token_mfa_configuration {
    enabled = true
  }
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
  username_attributes      = ["email"]
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length = 8
  }
  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }
  deletion_protection = "ACTIVE"
  admin_create_user_config {
    allow_admin_create_user_only = "true"
  }
}

resource "aws_cognito_user_pool_client" "userpool_client" {
  name         = "octnis-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  callback_urls = [
    "https://grafana.staging.uws-tech.com/oauth2/idpresponse",
    "https://kibana.staging.uws-tech.com/oauth2/idpresponse",
    "https://kube-dashboard.staging.uws-tech.com/oauth2/idpresponse",
    "https://prometheus.staging.uws-tech.com/oauth2/idpresponse",
    "https://argocd.staging.uws-tech.com/oauth2/idpresponse",
    "https://flower.staging.uws-tech.com/oauth2/idpresponse"
  ]
  supported_identity_providers         = ["COGNITO"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid", "profile", "aws.cognito.signin.user.admin"]
  generate_secret                      = true
  access_token_validity                = 10 // 10 hours
  refresh_token_validity               = 10 // 10 hours
  id_token_validity                    = 10 // 10 hours
  auth_session_validity                = 10 // 10 hours
  prevent_user_existence_errors        = "ENABLED"
  explicit_auth_flows = [
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]

}

// Amazon Cognito domain
resource "aws_cognito_user_pool_domain" "cognito-domain" {
  domain       = "octnis"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

// create cognito users
resource "aws_cognito_user" "user1" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = "mohamed.boumalouka@prestataire.april.com"
  attributes = {
    email          = "mohamed.boumalouka@prestataire.april.com"
    email_verified = true
  }
}
resource "aws_cognito_user" "user2" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = "Junejie.RUZOL@april.com"
  attributes = {
    email          = "Junejie.RUZOL@april.com"
    email_verified = true
  }
}

resource "aws_cognito_user" "user3" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = "Angelito.PLATON@april.com"
  attributes = {
    email          = "Angelito.PLATON@april.com"
    email_verified = true
  }
}

resource "aws_cognito_user" "user4" {
  attributes = {
    "email" = "vincent.canillas@april.com"
    "sub"   = "b91a65dc-20a1-7026-1cfc-29a38ae5c984"
  }
  enabled               = true
  preferred_mfa_setting = null
  user_pool_id          = "ap-southeast-1_2deJW9r4D"
  username              = "b91a65dc-20a1-7026-1cfc-29a38ae5c984"
}
