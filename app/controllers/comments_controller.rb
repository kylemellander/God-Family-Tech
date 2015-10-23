class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.update(user_id: current_user.id, post_id: params[:post_id])
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Comment was deleted.'
  end

private

  def set_comment
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
