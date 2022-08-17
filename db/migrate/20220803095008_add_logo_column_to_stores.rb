class AddLogoColumnToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :logo, :string
  end
end
