class Program < ApplicationRecord
  #self.primary_key = "nombre"	
  belongs_to :school
  belongs_to :teacher

  has_and_belongs_to_many :semesters
end
