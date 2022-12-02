class Contact < ApplicationRecord
  validates :name, :street_address, :city, :province, :country, :postal_code, presence: true
  validates :phone, :presence => true, :phone => true
  validates :email, format: { with: Devise.email_regexp }, presence: true
end
