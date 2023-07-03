class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :cart
end
