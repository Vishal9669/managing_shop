class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :sub_product


  after_create :update_total_price

  def update_total_price
    self.total_price = sub_product.price.to_i * order.quantity
    save
  end

end
