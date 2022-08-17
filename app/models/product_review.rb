class ProductReview < ApplicationRecord
    belongs_to :user
    belongs_to :product

    default_scope {order(created_at: :desc)}
end
