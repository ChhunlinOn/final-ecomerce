json.extract! admin_order_detail, :id, :order_id, :varain_detail_id, :qauntity, :price, :created_at, :updated_at
json.url admin_order_detail_url(admin_order_detail, format: :json)
