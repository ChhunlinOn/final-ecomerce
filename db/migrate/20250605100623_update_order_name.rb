class UpdateOrderName < ActiveRecord::Migration[8.0]
  def change
    rename_table "admin_orders", "orders"
  end
end
