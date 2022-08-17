class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :name, :text
    add_column :stores, :category_id, :integer
    add_column :stores, :email, :text 
    add_column :stores, :password_digest, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
