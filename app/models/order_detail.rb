class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: "orders_id", optional: true
  belongs_to :product, foreign_key: "products_id", optional: true

  # If you have variant_detail association
  # belongs_to :variant_detail, foreign_key: 'varain_detail_id', optional: true

  # Add validations
  validates :qauntity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Helper method for formatted price
  def formatted_price
    (price || 0) / 100.0
  end

  # Helper method for quantity (handles typo in column name)
  def quantity
    qauntity
  end

  def self.table_name
    "order_details"
  end
end
