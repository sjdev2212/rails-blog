class CommentsController < ApplicationController
  def new
    @current_user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    comment = Comment.new(comment_params.merge(author_id: @current_user.id, post_id: @post_id))
    if comment.valid?
      comment.save
      flash[:notice] = 'Comment created'

    else
      flash[:notice] = 'Could not create comment'

      # redirect_to user_post_path(@user_id, @post_id)
      # redirect_to new_user_post_comment_path(@current_user.id)

    end
    redirect_to user_post_path(@user_id, @post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
