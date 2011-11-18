class ArticlesController < InheritedResources::Base
  
  before_filter :init_comment, :only => [:show, :create, :update]
  
private
  
  def init_comment
    @comment = Comment.new
  end
    
end
