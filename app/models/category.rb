class Category < ApplicationRecord
  has_many :products
  validates :category_name, presence: true
  validates :product_price, numericality: true
end
