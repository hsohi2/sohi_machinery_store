class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code

      t.timestamps
    end
  end
end
