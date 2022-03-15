class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  def show
    @show_user = User.find(params[:id])
    @posts = @show_user.recent_posts
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
