class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.string :integer,
      t.string :order_total
      t.string :float

      t.timestamps
    end
  end
end
