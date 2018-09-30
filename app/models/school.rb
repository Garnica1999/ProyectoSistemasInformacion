class School < ApplicationRecord
  #self.primary_key = "nombre"
  belongs_to :teacher

  has_many :programs
end
