# Preview all emails at http://localhost:3000/rails/mailers/store_mailer
class StoreMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/store_mailer/password_reset
  def password_reset
    StoreMailer.password_reset
  end

end
