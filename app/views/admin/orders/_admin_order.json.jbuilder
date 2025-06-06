json.extract! admin_order, :id, :email_address, :user_id, :order_email, :first_name, :last_name, :order_address, :country, :city, :order_status, :mobile_phone, :created_at, :updated_at
json.url admin_order_url(admin_order, format: :json)
