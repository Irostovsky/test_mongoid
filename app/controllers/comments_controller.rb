class CommentsController < ApplicationController
  before_filter :find_article

  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.create params[:comment]
    if @comment.valid?
      flash[:notice] = 'Comment created!'
      render :create, :layout => false
    else
      render :create_errors, :layout => false
    end
  end
  
  def destroy
    @comment = @article.comments.find params[:id]
    @comment.destroy
    flash[:notice] = 'Comment deleted!'
  end

private

  def find_article
    @article = Article.find params[:article_id]
  end
end
