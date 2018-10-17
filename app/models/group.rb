class Group < ApplicationRecord


    #self.primary_key = "codigo", "subject"
	belongs_to :subject
	#OPTIONAL ASEGURA QUE NO SEA ENCESARIO PASAR LA REFERENCIA, QUE ESTA SE NULA
	belongs_to :teacher, optional: true 

	has_and_belongs_to_many :schedules
	has_and_belongs_to_many :students
	has_many :notes
end
