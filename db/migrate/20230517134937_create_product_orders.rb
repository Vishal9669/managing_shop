class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
