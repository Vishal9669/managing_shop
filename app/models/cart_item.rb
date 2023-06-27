class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :sub_product
  validates :sub_product_id, uniqueness: { scope: :cart_id }
  before_save :set_total
  after_save :update_cart_grand_total
  after_destroy :update_cart_grand_total

  def set_total
    self.total = sub_product.price.to_f * quantity.to_f
  end

  def update_cart_grand_total
    self.cart.grand_total = cart.cart_items.sum(:total)
    self.cart.save
  end
end
