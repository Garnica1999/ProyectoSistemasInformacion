class Program < ApplicationRecord
  belongs_to :school
  belongs_to :teacher

  has_and_belongs_to_many :semesters
end
