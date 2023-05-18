class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :product_orders
  has_many :product_orders, dependent: :destroy

  before_save :update_grand_total



  def update_grand_total
    self.grand_total = price * quantity
    save
  end


end
