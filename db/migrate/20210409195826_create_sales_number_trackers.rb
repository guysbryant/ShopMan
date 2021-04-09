class CreateSalesNumberTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_number_trackers do |t|
      t.integer :sales_number, default: 1000
      t.timestamps
    end
  end
end
