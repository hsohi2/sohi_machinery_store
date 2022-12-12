class Province < ApplicationRecord
  validates :province_name, :gst, :pst, :hst, presence: true
  validates :gst, :pst, :hst, numericality: true
end
