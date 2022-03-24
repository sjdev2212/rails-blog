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

    end
    redirect_to user_post_path(@user_id, @post_id)
  end


  def destroy 
    @current_user = current_user 
    @user = User.find_by(id: params[:user_id]) 
    @post = @user.posts.find_by(id: params[:post_id])
    @comment = @post.comments.find(params[:id]) 
    @comment.destroy 
    redirect_to user_posts_path(@user.id), success: 'Comment was successfully deleted' 
  end 

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
