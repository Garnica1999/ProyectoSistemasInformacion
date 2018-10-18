class Group < ApplicationRecord


    #self.primary_key = "codigo", "subject"
	belongs_to :subject
	#OPTIONAL ASEGURA QUE NO SEA ENCESARIO PASAR LA REFERENCIA, QUE ESTA SE NULA
	belongs_to :teacher, optional: true 

	has_and_belongs_to_many :schedules
	has_and_belongs_to_many :students
	has_many :notes

	def self.toArray
		arr = Array.new
		groups = Group.all
		groups.each do |group|
			subject = group.subject.nombre
			arr.push(group.id.to_s + "-" + group.codigo.to_s + "-" + subject)
		end
		return arr
	end
end
