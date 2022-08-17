class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :store_id
      t.text :customer_name
      t.text :delivery_address
      t.text :phone_number
      t.text :recipient_email

      t.timestamps
    end
  end
end
