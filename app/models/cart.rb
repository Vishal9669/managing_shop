class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  accepts_nested_attributes_for :cart_items
end
