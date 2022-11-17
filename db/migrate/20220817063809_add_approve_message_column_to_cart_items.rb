class AddApproveMessageColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :approve_message, :json
  end
end
