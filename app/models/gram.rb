class Gram
  include ActiveModel::Model

  attr_accessor :id, :src, :url, :caption

  def persisted?
    false
  end
end
