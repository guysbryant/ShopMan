class CreatePurchaseOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_order_lines do |t|
      t.references :product, foreign_key: true
      t.int :qty
      t.int :price
      t.references :purchase_order, foreign_key: true
      t.int :line_number

      t.timestamps
    end
  end
end
