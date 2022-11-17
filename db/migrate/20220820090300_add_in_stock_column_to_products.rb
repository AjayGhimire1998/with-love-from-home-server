class AddInStockColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :in_stock, :integer
  end
end
