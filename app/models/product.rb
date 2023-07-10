class Product < ApplicationRecord
  has_many :sub_products, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
