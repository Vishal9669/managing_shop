class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  has_many :carts

end
