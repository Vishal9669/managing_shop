require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, email, and password" do
    user = User.new(
      first_name: "xyz",
      email: "xyz@example.com",
      password: "password123"
    )

    expect(user).to be_valid
  end
end
