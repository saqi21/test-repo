class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string  :dob
      t.string  :cnic
      t.string  :address

      t.timestamps
    end
  end
end
