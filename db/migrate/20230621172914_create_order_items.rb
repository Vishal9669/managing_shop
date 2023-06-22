class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :sub_product, foreign_key: true
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
