require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { User.create(name: "Abdul", photo: "unknown") }
  let!(:post1) { user.posts.create(title: "First Post", text: "This is the first",) }

  describe "GET #index" do
    it "it assigns @posts returns a success response" do
      get :index, params: { user_id: user.id }
      expect(assigns(:posts)).to eq(user.posts)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "assigns @post and returns a success response" do
      get :show, params: { user_id: user.id, id: post1.id }
      expect(assigns(:post)).to eq(post1)
      expect(response).to have_http_status(:success)
    end
  end
end
