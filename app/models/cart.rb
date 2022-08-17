class Cart < ApplicationRecord
    belongs_to :user
    belongs_to :store
    has_many :cart_items, dependent: :destroy
    validates :customer_name, :delivery_address, :phone_number, :recipient_email, presence: true
    
end
