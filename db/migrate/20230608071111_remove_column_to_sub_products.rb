class RemoveColumnToSubProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :sub_products, :mfg_date
  end
end
