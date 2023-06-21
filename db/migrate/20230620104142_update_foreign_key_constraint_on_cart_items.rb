class UpdateForeignKeyConstraintOnCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :cart_items, :carts
    add_foreign_key :cart_items, :carts, on_delete: :cascade
  end
end
