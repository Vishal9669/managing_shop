class ProductOrder < ApplicationRecord

  has_many :order
  has_many :sub_products

  after_create :update_total_price

  def update_total_price
    self.total_price = sub_product.price.to_i * cart.quantity
    save
  end

end
