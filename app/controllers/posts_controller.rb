class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @post_id = params[:id]
  end

  def show
    @user = User.find(params[:id])
  
    @post = Post.find(params[:id])
  end

  def new
    @current_user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    post = Post.new(post_params.merge(author_id: @current_user.id, comments_counter: 0, likes_counter: 0))
    if post.valid?
      post.save
      flash[:notice] = 'Post created'
    else
      flash[:notice] = 'Could not create post'
    end
    redirect_to user_path(@current_user.id)
  end

  def destroy
    @user = User.find(params[:author_id])
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post item was successfully removed.'
    else
      flash[:error] = 'Try again.'
    end
    redirect_to "/users/#{@user.id}/posts"
  end
private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
