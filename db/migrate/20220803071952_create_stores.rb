class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|

      t.timestamps
    end
  end
end
