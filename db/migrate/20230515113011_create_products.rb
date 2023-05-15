class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :company_name
      t.datetime :mfg_date
      t.datetime :exp_date
      t.string :quality
      t.decimal :price

      t.timestamps
    end
  end
end
