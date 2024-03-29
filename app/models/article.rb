class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  field :name
  field :content
  field :published_on, :type => Date
  validates_presence_of :name
  embeds_many :comments
end
