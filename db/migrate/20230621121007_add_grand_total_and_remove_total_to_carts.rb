class AddGrandTotalAndRemoveTotalToCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :total, :decimal
    add_column :carts, :grand_total, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
