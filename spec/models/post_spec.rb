require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { User.create(name: "Abdul") }
  it "should be valid with valid attributes" do
    post = user.posts.create(title: "My first post title")
    expect(post).to be_valid
  end
end
