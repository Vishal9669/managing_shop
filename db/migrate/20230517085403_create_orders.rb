class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.float :total_price
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
