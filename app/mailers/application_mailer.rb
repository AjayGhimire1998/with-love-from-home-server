class ApplicationMailer < ActionMailer::Base
  default from: ENV["GMAIL_ACCOUNT"]
  layout 'mailer'
end
