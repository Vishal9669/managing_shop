class RemoveForeignKeyFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :orders, :products
    remove_column :orders, :product_id

  end
end
