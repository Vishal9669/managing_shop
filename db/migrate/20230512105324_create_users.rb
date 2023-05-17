class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.bigint :contact_no
      t.string :address
      t.string :gender
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
