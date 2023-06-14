class RemoveQuantityAndSubProductFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :quantity, :integer
    remove_column :carts, :sub_product_id, :integer
  end
end
