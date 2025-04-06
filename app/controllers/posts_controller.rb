class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :destroy]
  def index
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = @user.posts.new
  end
  def show
    
  end

  def create
    @post = @user.posts.new(post_params)
      respond_to do |format|
        if @post.save
          format.html { redirect_to user_post_path(@user, @post), notice: "Post created successfully" }
        else
          render :new, status: :unprocessable_entity
        end
      end
  end

  def destroy
      @post.destroy
      redirect_to root_path, notice: "Post deleted successfully"
  end

  private

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def set_user
    @user=User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
