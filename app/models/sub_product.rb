class SubProduct < ApplicationRecord
  belongs_to :product

  validates :company_name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :description, presence: true, length: { minimum: 1, maximum: 500 }
  validates :mfg_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
