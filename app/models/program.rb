class Program < ApplicationRecord
  #self.primary_key = "nombre"	
  belongs_to :school
  belongs_to :teacher, optional: true
  has_many :students
  has_and_belongs_to_many :semesters
end
