class AddGrandTotalAndRemoveTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :total, :decimal
    add_column :orders, :grand_total, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
