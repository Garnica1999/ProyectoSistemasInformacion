class Teacher < ApplicationRecord
	has_many :groups
	has_many :schools
	has_many :programs
end
