class Comment
  include Mongoid::Document
  field :name
  field :content
  embedded_in :article
  validates_presence_of :name
end
