class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :sub_product
end
