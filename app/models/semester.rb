class Semester < ApplicationRecord
	#self.primary_key = "semestre"

	has_many :subjects
	has_many :logs

	has_and_belongs_to_many :students
	has_and_belongs_to_many :programs

	def self.obtenerSemestreporID(id_semester)
		return Semester.find(id_semester).semestre
	end

	def self.obtenerSemestres
		semesters = Semester.all
		arr = Array.new	
		semesters.each do |semester|
			arr.push(semester.id.to_s + "-" + semester.semestre.to_s + " Semestre")
		end
		return arr
	end
end
