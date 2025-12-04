environment    = "local"
project        = "landingpage"
team           = "at"
aws_region     = "ap-southeast-1"
access_key_arn = "arn:aws:iam::584102114761:user/quinn.vo"

admin_users = ["josh.tran", "ken.nguyen", "dennis.le", "troy.vo"]

domain_alias = ["static.nexdev.net"]

###CORS Conf
cors_allowed_headers = [
  "Accept",
  "Access-Control-Allow-Origin",
  "Content-Type",
  "Origin",
]
cors_allowed_methods = [
  "GET",
  "HEAD",
]
cors_allowed_origins = [
  "*.nexdev.net"
]
cors_max_age_seconds = 3600
