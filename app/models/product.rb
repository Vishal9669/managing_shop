class Product < ApplicationRecord
  has_many :product_orders

  validates :name,:company_name, :mfg_date, :exp_date, :quality, :price, presence: true
end
