class RemoveAndAddColumnsTo < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :quantity
  end
end
