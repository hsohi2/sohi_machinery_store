class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :province_name
      t.float :gst
      t.float :pst
      t.float :hst

      t.timestamps
    end
  end
end
