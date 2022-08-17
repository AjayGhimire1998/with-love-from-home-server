class Product < ApplicationRecord
    belongs_to :store

    has_many :product_reviews
    before_save :titleize_name
    default_scope {order(updated_at: :desc)}

    private 
    def titleize_name 
        self.name = name.titleize
    end
end
