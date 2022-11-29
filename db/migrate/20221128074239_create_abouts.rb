class CreateAbouts < ActiveRecord::Migration[7.0]
  def change
    create_table :abouts do |t|
      t.string :title1
      t.string :description1
      t.string :title2
      t.string :description2

      t.timestamps
    end
  end
end
