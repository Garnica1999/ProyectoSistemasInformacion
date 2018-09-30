class Subject < ApplicationRecord
  self.primary_key = "codigo"
  belongs_to :semester
  has_many :groups
  has_many :notes
end
