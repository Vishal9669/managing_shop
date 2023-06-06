class Product < ApplicationRecord
  has_many :product_orders
  has_many :sub_products
  has_many :orderables
  has_many :carts, through: :orderables

  validates :name, presence: true, uniqueness: true
end
