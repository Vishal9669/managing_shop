class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  accepts_nested_attributes_for :product_orders
  accepts_nested_attributes_for :user
end
