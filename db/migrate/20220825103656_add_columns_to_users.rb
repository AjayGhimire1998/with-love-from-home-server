class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_reset_token, :text
    add_column :users, :password_reset_sent_at, :datetime 
    add_column :stores, :password_reset_token, :text
    add_column :stores, :password_reset_sent_at, :datetime 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
