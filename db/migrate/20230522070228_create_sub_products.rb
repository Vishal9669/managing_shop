class CreateSubProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_products do |t|

      t.string :company_name
      t.string :description
      t.date :mfg_date
      t.decimal :price

      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
