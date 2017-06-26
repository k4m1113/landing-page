class Project < ApplicationRecord
  acts_as_taggable_on :keywords

end
