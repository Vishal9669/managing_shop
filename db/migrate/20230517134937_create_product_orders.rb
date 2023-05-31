class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.integer :quantity
      t.float :total_price

      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true



      t.timestamps
    end
  end
end
