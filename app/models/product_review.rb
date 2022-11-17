class ProductReview < ApplicationRecord
    belongs_to :user
    belongs_to :product, dependent: :destroy

    validates :user_id, uniqueness: {
        scope: [ :product_id ],
        message: "already have reviewed the product"
      }

    default_scope {order(created_at: :desc)}
end
