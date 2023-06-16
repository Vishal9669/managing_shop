class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :sub_product

  validates :sub_product_id, uniqueness: { scope: :cart_id }

  before_save :set_total

  private

  def set_total
    self.total = sub_product.price.to_f * quantity.to_f
  end
end
