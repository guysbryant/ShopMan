class SalesOrderLine < ApplicationRecord
  belongs_to :product
  belongs_to :sales_order
end
