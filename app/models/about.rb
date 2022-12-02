class About < ApplicationRecord
  validates :title1, :description1, :title2, :description2, presence: true
end
