class Product < ApplicationRecord
  paginates_per 20
  has_one_attached :image
  belongs_to :category
end
