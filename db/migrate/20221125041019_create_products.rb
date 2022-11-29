class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.integer :category_id
      t.string :product_name
      t.string :product_description
      t.float :product_price
      t.string :product_image
      t.integer :product_likes

      t.timestamps
    end
  end
end
