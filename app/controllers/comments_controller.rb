class CommentsController < InheritedResources::Base
  belongs_to :article
  actions :create, :destroy
  respond_to :js
  layout false
  
  def create
    create! do |success, failure|
      failure.js { render :new }
    end
  end
end
