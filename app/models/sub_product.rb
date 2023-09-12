class SubProduct < ApplicationRecord
  belongs_to :product
  has_many :cart_items

  validates :company_name, presence: true, length: { in: 1..10 }
  validates :description, presence: true,  uniqueness: true, length: { in: 1..1000 }, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
