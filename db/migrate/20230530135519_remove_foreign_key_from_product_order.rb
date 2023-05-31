class RemoveForeignKeyFromProductOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_orders, :product_id, :integer
  end
end
