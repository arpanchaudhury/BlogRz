class Comment
  include Mongoid::Document
  field :content, type: String
  
  # n:1 relationship with post
  belongs_to :post

  # n:1 relationship with blogger
  belongs_to :blogger
end
