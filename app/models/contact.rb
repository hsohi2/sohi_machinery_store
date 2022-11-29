class Contact < ApplicationRecord
  validates :name, :street_address, :city, :province, :country, :postal_code, presence: true
  validates :phone, :presence => true, :phone => true
  validates :email, email: true, presence: true
end
