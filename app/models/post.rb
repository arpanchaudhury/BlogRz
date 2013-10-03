class Post
  include Mongoid::Document
  include Mongoid::TaggableWithContext
  
  attr_accessible :title, :body, :published_on, :tags, :vote_up, :vote_down

  field :title
  field :body
  field :published_on, type: DateTime, default: Time.now
  field :vote_up, type: Array, default: []
  field :vote_down, type: Array, default: []
  taggable :tags, separator: ' ', default: []
  
  # n:1 relationship with blogger
  belongs_to :blogger

  # 1:n relationship with comment
  has_many :comments
end
