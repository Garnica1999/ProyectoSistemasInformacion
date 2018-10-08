class Semester < ApplicationRecord
	#self.primary_key = "semestre"

	has_many :subjects
	has_many :logs

	has_and_belongs_to_many :students
	has_and_belongs_to_many :programs
end
