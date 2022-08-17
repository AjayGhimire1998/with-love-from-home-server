class Review < ApplicationRecord
    belongs_to :user
    belongs_to :store

    default_scope {order(created_at: :desc)}
end
