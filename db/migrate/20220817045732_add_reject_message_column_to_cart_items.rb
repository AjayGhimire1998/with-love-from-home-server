class AddRejectMessageColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :reject_message, :text
  end
end
