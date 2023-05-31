class AddColumnsInProductOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :product_orders, :sub_product_id, :integer
  end
end
