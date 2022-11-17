class Review < ApplicationRecord
    belongs_to :user
    belongs_to :store, dependent: :destroy

    validates :user_id, uniqueness: {
        scope: [ :store_id ],
        message: "already have reviewed the product"
      }

    default_scope {order(created_at: :desc)}
end
