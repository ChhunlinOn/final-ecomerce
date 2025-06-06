class CreateAdminOrderDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :varain_detail_id
      t.integer :qauntity
      t.integer :price

      t.timestamps
    end
  end
end
