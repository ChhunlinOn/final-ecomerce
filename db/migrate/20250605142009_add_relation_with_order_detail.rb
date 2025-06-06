class AddRelationWithOrderDetail < ActiveRecord::Migration[8.0]
  def change
    # Assuming order_details table already exists
    add_reference :order_details, :orders, null: false, foreign_key: true
    add_reference :order_details, :products, null: false, foreign_key: true
  end
end
