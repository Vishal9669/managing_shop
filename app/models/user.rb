class User < ApplicationRecord
  has_many :orders
  

  #validates :first_name,:last_name, :email, :contact_no, :address, :gender
end
