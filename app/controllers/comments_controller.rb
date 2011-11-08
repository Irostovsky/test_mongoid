class CommentsController < ApplicationController
  before_filter :find_article

  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.create params[:comment]
    if @comment.valid?
      redirect_to @article, :notice => 'Comment created!'
    else
      render :template => '/articles/show'
    end
  end
  
  def destroy
    @comment = @article.comments.find params[:id]
    @comment.destroy
    redirect_to @article, :notice => 'Comment deleted!'
  end

private

  def find_article
    @article = Article.find params[:article_id]
  end
end
