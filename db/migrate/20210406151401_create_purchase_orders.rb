class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.integer :po_number
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
