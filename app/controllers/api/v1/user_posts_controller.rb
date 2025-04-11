class Api::V1::UserPostsController < ApplicationController
  before_action :authenticate_user!
  def index
    user = User.find(params[:user_id])
    posts = user.posts.includes(:comments, :likes)

    render json: posts.as_json(include: [ :comments, :likes ])
  end
end
