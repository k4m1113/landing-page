class School < ApplicationRecord
  acts_as_taggable_on :subjects, :honors
end
