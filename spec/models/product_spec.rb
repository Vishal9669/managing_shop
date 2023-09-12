require 'rails_helper'

RSpec.describe Product, type: :model do
 it "is valid with a name" do
  product = Product.new(name: "laptop")
  expect(product).to be_valid
  end
end
