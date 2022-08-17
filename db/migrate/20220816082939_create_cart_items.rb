class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :amount
      t.integer :total
      t.text :status

      t.timestamps
    end
  end
end
