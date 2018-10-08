class Subject < ApplicationRecord
  #self.primary_key = "codigo"
  belongs_to :semester
  belongs_to :student, optional: true
  has_many :groups
  has_many :notes
  has_many :logs
end
