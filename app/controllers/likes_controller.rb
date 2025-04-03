class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.new(user: current_user)
    if @like.save
      redirect_to user_post_path(@post.author, @post), notice: "Post liked!"
    else
      redirect_to user_post_path(@post.author, @post), alert:  "You already liked the post"
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    @like.destroy if  @like
    redirect_to user_post_path(@post.author, @post), notice: "Like removed."
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
