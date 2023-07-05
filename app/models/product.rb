class Product < ApplicationRecord
  has_many :sub_products

  validates :name, presence: true, uniqueness: true
end
