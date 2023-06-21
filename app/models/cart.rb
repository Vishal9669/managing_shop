class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables
  has_many :cart_items
  belongs_to :user

  accepts_nested_attributes_for :cart_items

  before_save :calculate_grand_total

  def calculate_grand_total
    cart_items.sum(:total)
  end
end
