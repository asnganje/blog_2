class Api::V1::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :set_post, only: [ :index, :create ]

  def index
    comments = post.comments.includes(:user)
    render json: comments.as_json
  end

  def create
    comment = post.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      render json: comment.as_json
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    user = User.find(params[:user_id])
  end

  def set_post
    post = user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
