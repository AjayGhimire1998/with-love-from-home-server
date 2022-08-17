class Store < ApplicationRecord
  has_many :products
  has_one :category
  has_many :reviews
  has_many :carts
  has_secure_password

  validates :name, uniqueness: true, presence: true
  before_save :downcase_email 
  before_save :titleize_name
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid"}, presence: true, uniqueness: true

  private 
  def downcase_email 
      self.email = email.downcase
  end

  def titleize_name 
    self.name = name.titleize
  end
end
