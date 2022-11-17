class Product < ApplicationRecord
    belongs_to :store

    has_many :product_reviews
    before_save :titleize_name
    validates :name, presence: true
    validates :description, presence: true
    validates :images, presence: true
    validates :price, presence: true
    validates :in_stock, presence: true
    default_scope {order(created_at: :desc)}

    private 
    def titleize_name 
        self.name = name.titleize
    end
end
