resource "aws_cognito_user_pool" "user_pool-eu" {
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
  provider = aws.Paris
}

resource "aws_cognito_user_pool_client" "userpool_client-eu" {
  name         = "octnis-client"
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  callback_urls = [
    "https://grafana.preprod.eu.uws-tech.com/oauth2/idpresponse",
    "https://kibana.preprod.eu.uws-tech.com/oauth2/idpresponse",
    "https://kube-dashboard.preprod.eu.uws-tech.com/oauth2/idpresponse",
    "https://prometheus.preprod.eu.uws-tech.com/oauth2/idpresponse",
    "https://argocd.preprod.eu.uws-tech.com/oauth2/idpresponse",
  "https://flower.preprod.eu.uws-tech.com/oauth2/idpresponse"]
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
  provider = aws.Paris
}

// Amazon Cognito domain
resource "aws_cognito_user_pool_domain" "cognito-domain-eu" {
  domain       = "octnis-preprod-eu"
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  provider     = aws.Paris
}

// create cognito users
resource "aws_cognito_user" "user1-eu" {
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  username     = "mohamed.boumalouka@prestataire.april.com"
  attributes = {
    email          = "mohamed.boumalouka@prestataire.april.com"
    email_verified = true
  }
  provider = aws.Paris
}
resource "aws_cognito_user" "user2-eu" {
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  username     = "Junejie.RUZOL@april.com"
  attributes = {
    email          = "Junejie.RUZOL@april.com"
    email_verified = true
  }
  provider = aws.Paris
}


resource "aws_cognito_user" "user3" {
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  username     = "Angelito.PLATON@april.com"
  attributes = {
    email          = "Angelito.PLATON@april.com"
    email_verified = true
  }
  provider = aws.Paris
}


resource "aws_cognito_user" "user4" {
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  username     = "vincent.canillas@april.com"
  attributes = {
    email          = "vincent.canillas@april.com"
    email_verified = true
  }
  provider = aws.Paris
}

resource "aws_cognito_user" "lucille" {
  user_pool_id = aws_cognito_user_pool.user_pool-eu.id
  username     = "lucille.senturias@april.com"
  attributes = {
    email          = "lucille.senturias@april.com"
    email_verified = true
  }
  provider = aws.Paris
}