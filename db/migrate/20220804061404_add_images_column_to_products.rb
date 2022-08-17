class AddImagesColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :images, :text, array: true, default: []
  end
end
