class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  has_many :cart_items
  belongs_to :user
  has_one :order

  accepts_nested_attributes_for :cart_items

  def calculate_grand_total
    cart_items.sum(:total)
  end
end
