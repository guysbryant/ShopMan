class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :address
      t.integer :phone_number
      t.integer :pay_rate

      t.timestamps
    end
  end
end
