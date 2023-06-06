class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

      t.references :sub_product, foreign_key: true

      t.timestamps
    end
  end
end
