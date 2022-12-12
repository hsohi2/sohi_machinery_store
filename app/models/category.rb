class Category < ApplicationRecord
  has_many :products, dependent: :nullify
  validates :category_name, :category_description, presence: true
end
