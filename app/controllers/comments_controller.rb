class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_email = current_user.email
    if @comment.save
      flash[:notice]= 'Comment was posted!'
      redirect_to(:back)
    else
      render('new')
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Comment was edited"
      redirect_to(:back)
    else
      render('edit')
    end
  end

  def delete
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    flash[:notice] = "Comment was deleted"
    redirect_to(:back)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :article_id, :category_id)
  end
end
