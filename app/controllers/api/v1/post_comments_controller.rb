class Api::V1::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    comments = post.comments.includes(:user)

    render json: comments.as_json
  end
end
