class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders, inverse_of: :order, dependent: :destroy

  accepts_nested_attributes_for :product_orders
  accepts_nested_attributes_for :user


  validates :user_id, :quantity, presence: true
end
