class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :update_total_price

  def update_total_price
    self.total_price = product.price * order.quantity
  end
end
