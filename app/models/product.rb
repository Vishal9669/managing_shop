class Product < ApplicationRecord
  has_many :sub_products, dependent: :destroy

  validates_uniqueness_of :name, :case_sensitive => false
end
