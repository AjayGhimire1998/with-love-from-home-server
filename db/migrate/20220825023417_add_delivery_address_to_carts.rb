class AddDeliveryAddressToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :delivery_address, :json
  end
end
