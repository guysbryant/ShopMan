class AddSalesNumberTrackerToSalesOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales_orders, :sales_number_tracker, index: true
  end
end
