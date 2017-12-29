class ApplicationMailer < ActionMailer::Base
  default from: "reminder@reminutes.com"
  layout 'mailer'
end
