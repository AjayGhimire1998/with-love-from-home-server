class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :category
  has_many :reviews
  has_many :carts
  has_secure_password

  validates :name, uniqueness: true, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :logo, presence: true
  before_save :downcase_email 
  before_save :titleize_name
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Invalid"}, presence: true, uniqueness: true, on: :create


  def send_store_password_reset
    self.password_reset_token = generate_base64_token
    self.password_reset_sent_at = Time.zone.now
    save!
    StoreMailer.store_password_reset(self).deliver_now
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

  def titleize_name 
    self.name = name.titleize
  end
end
