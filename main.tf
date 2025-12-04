# create acm and explicitly set it to us-east-1 provider
# module "acm_request_certificate" {
#   source = "git::https://gitlab.nexdev.net/iac/terraform/modules/cloudposse/aws-acm-request-certificate.git?ref=v0.18.1"
#   providers = {
#     aws = "aws-us-east-1"
#   }
#   domain_name                       = "example.com"
#   subject_alternative_names         = ["a.example.com", "b.example.com", "*.c.example.com"]
#   process_domain_validation_options = true
#   ttl                               = "300"
# }


# reuse an existing s3 bucket eg-prod-app for a cloudfront cdn.
module "cdn" {
  # source = "cloudposse/cloudfront-s3-cdn/aws"
  source = "git::https://gitlab.nexdev.net/iac/terraform/modules/cloudposse/aws-cloudfront-s3-cdn.git?ref=v1.1.0"

  # origin_bucket        = "at-landingpage-local"
  # origin_bucket_region = "ap-east-1"
  # name                 = "at-landingpage-local"
  namespace   = var.team
  environment = var.environment
  name        = var.project
  label_order = ["namespace", "name", "environment", "attributes"]
  aliases     = ["static.nexdev.net"]
  tags = {
    Dept         = "VNTeam"
    Team         = var.team
    ManageBy     = "vnTerraform"
    Environment  = upper(var.environment)
    map-migrated = "migQK0IMQ5LFK"
  }

  cloudfront_access_logging_enabled = false

  # CORS conf fos S3 Original
  cors_allowed_headers = var.cors_allowed_headers
  cors_allowed_methods = var.cors_allowed_methods
  cors_allowed_origins = var.cors_allowed_origins
  cors_max_age_seconds = var.cors_max_age_seconds


  # acm_certificate_arn = module.acm_request_certificate.arn

  # depends_on = [module.acm_request_certificate]
}


# resource "aws_cloudfront_response_headers_policy" "proj_12b" {
#   name = "at-landingpage-reponse policy"
#   cors_config {
#     access_control_allow_credentials = false
#     access_control_allow_headers = [
#       {
#         items = [
#           "Accept",
#           "Access-Control-Allow-Origin",
#           "Content-Type",
#           "Origin",
#         ]
#       },
#     ]
#     access_control_allow_methods = [
#       {
#         items = [
#           "GET",
#           "HEAD",
#         ]
#       },
#     ]
#     access_control_allow_origins = [
#       {
#         items = [
#           "*.nexdev.net",
#         ]
#       },
#     ]
#     access_control_expose_headers = []
#     access_control_max_age_sec    = 0
#     origin_override               = true
#   }
#   security_headers_config {
#     content_security_policy = []
#     content_type_options = [
#       {
#         override = true
#       },
#     ]
#     frame_options = [
#       {
#         frame_option = "SAMEORIGIN"
#         override     = false
#       },
#     ]
#     referrer_policy = [
#       {
#         override        = false
#         referrer_policy = "strict-origin-when-cross-origin"
#       },
#     ]
#     strict_transport_security = [
#       {
#         access_control_max_age_sec = 31536000
#         include_subdomains         = false
#         override                   = false
#         preload                    = false
#       },
#     ]
#     xss_protection = [
#       {
#         mode_block = true
#         override   = false
#         protection = true
#         report_uri = ""
#       },
#     ]
#   }
# }
