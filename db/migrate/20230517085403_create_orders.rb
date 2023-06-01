class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity

      t.references :product, foreign_key: true
      t.references :sub_product, foreign_key: true

      t.timestamps
    end
  end
end
