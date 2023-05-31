class RemoveForeignKeyFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :sub_product_id, :integer
    remove_column :orders, :product_id, :integer
  end
end
