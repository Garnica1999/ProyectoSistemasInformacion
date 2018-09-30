class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :validatable
	has_many :groups
	has_many :notes

	#RELACION MUCHOS A MUCHOS
	has_and_belongs_to_many :semesters
end
