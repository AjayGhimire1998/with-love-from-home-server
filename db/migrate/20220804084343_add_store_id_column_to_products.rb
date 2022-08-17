class AddStoreIdColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :store_id, :integer
  end
end
