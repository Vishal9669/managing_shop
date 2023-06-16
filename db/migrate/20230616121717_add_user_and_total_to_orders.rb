class AddUserAndTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true
    add_column :orders, :total, :decimal
  end
end
