class RemoveColumnReviewFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :review
  end
end
