class School < ApplicationRecord
  #self.primary_key = "nombre"
  belongs_to :teacher, optional: true

  has_many :programs
end
