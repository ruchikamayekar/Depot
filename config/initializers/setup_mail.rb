ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "domain.of.sender.net",
  authentication: "plain",
  user_name: "dave",
  password: "secret",
  enable_starttls_auto: true
}
