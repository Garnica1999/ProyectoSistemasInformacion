class Subject < ApplicationRecord
  belongs_to :semester
  has_many :groups
  has_many :notes
end
