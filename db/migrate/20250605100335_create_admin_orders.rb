class CreateAdminOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :admin_orders do |t|
      t.string :email_address
      t.integer :user_id
      t.string :order_email
      t.string :first_name
      t.string :last_name
      t.string :order_address
      t.string :country
      t.string :city
      t.string :order_status
      t.string :mobile_phone

      t.timestamps
    end
  end
end
