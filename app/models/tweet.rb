class Tweet
  include ActiveModel::Model

  attr_accessor :id, :url, :text

  def persisted?
    false
  end
end
