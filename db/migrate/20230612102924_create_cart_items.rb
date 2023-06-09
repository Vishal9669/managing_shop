class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :sub_product, foreign_key: true
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
