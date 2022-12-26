class AddVerifyCodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_verify, :boolean , default: false
    add_column :users, :phone_verify, :boolean , default: false
  end
end
