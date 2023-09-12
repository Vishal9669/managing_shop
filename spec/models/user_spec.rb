require 'rails_helper'

RSpec.describe User, type: :model do
 it "is valid with a name" do
  user = User.new(first_name: "abc", email:"xyz@gmail.com", password:"123@password")
  expect(user).to be_valid
  end
end
