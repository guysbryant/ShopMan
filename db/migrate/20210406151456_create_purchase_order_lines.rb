class CreatePurchaseOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_order_lines do |t|
      t.references :product, foreign_key: true
      t.integer :qty
      t.integer :price
      t.references :purchase_order, foreign_key: true
      t.integer :line_number

      t.timestamps
    end
  end
end
