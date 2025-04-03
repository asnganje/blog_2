class CommentsController < ApplicationController
  before_action :set_user_and_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
      respond_to do |format|
        if @comment.save
          format.html { redirect_to user_post_path(@user, @post), notice: "Comment created successfully" }
        else
          render "posts/show", status: :unprocessable_entity
        end
      end
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
