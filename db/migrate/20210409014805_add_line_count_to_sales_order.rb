class AddLineCountToSalesOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_orders, :number_of_lines, :integer, default: 0
  end
end
