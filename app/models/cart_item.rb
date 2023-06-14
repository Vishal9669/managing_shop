class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :sub_product
end
