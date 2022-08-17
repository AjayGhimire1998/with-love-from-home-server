class User < ApplicationRecord
    has_many :reviews
    has_many :carts

    has_secure_password 
    before_save :downcase_email 
    # before_save :titleize_fullname
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid"}, presence: true, uniqueness: true
    
    private 
    def downcase_email 
        self.email = email.downcase
    end
    # def titleize_fullname 
    #     self.fullname = fullname.titleize
    # end
end


