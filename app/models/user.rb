class User < ApplicationRecord
  has_many :orders



  validates :first_name,:last_name, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_no, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number"}
  validates :address, presence: true
  validates :gender, presence: true

end
