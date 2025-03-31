require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be valid with valid attributes" do
    user= User.new(name: "Abdul")
    expect(user).to be_valid
  end
end
