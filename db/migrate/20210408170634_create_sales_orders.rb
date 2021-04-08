class CreateSalesOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_orders do |t|
      t.integer :sales_order_number
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
