# app/models/stock.rb
class Stock < ApplicationRecord
  belongs_to :product
  validates :size, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end