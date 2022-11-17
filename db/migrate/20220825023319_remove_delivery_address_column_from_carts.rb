class RemoveDeliveryAddressColumnFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :delivery_address
  end
end
