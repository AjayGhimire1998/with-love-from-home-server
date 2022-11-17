class User < ApplicationRecord
    has_many :reviews
    has_many :carts

    has_secure_password 
    before_save :downcase_email 
    # before_save :titleize_fullname
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid"}, presence: true, uniqueness: true
    
    def send_user_password_reset
        self.password_reset_token = generate_base64_token
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.user_password_reset(self).deliver_now
    end

    def password_token_valid?
        (self.password_reset_sent_at + 1.hour) > Time.zone.now
    end

    def reset_password(password)
        self.password_reset_token = nil
        self.password = password
        save!
    end

    private

    def generate_base64_token
        test = SecureRandom.urlsafe_base64
    end
    
    def downcase_email 
        self.email = email.downcase
    end
    # def titleize_fullname 
    #     self.fullname = fullname.titleize
    # end
end


