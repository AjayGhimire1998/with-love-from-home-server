class CreateProductReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :product_reviews do |t|
      t.text :content
      t.integer :product_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
