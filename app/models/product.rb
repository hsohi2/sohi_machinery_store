class Product < ApplicationRecord
  paginates_per 20
  has_one_attached :image
  belongs_to :category
  validates :product_name, :product_price, :product_description, presence: true
  validates :product_price, numericality: true
end
