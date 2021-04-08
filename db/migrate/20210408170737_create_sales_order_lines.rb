class CreateSalesOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_order_lines do |t|
      t.references :product, foreign_key: true
      t.references :sales_order, foreign_key: true
      t.integer :qty
      t.integer :price
      t.integer :line_number

      t.timestamps
    end
  end
end
