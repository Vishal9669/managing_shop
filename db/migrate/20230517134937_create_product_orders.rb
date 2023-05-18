class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
