class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.order(:id)
  end

  def show
    @show_user = current_user
    @posts = @show_user.recent_posts
  end
end
