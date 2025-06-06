# app/models/product.rb
class Product < ApplicationRecord
  belongs_to :category
  has_many :stocks, dependent: :destroy
  validates :name, :price, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end