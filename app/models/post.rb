class Post
  include ActiveModel::Model

  attr_accessor :id, :url, :title, :text
  
  def persisted?
    false
  end
end
