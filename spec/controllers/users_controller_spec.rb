require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { User.create(name: "Abdul", photo: "unknown") }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end
end
