class AddCitydetailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :state, :string
    add_column :users, :zipcode, :integer
    add_column :users, :city, :string
  end
end

