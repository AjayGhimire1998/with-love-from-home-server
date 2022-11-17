class RemoveColumnAvailableFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :available
  end
end
