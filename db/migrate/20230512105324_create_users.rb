class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :Id
      t.string :Firstname
      t.string :Lastname
      t.string :Email
      t.integer :Contactno
      t.string :Address
      t.string :Gender

      t.timestamps
    end
  end
end
