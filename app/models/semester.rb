class Semester < ApplicationRecord
	has_many :subjects

	has_and_belongs_to_many :students
	has_and_belongs_to_many :programs
end
