class Student < ApplicationRecord

	#RELACIONES UNO A MUCHOS
	has_many :groups
	has_many :notes

	#RELACION MUCHOS A MUCHOS
	has_and_belongs_to_many :semesters

	validates_confirmation_of :clave

	validates :documento, presence: true , length: {minimum: 7}, uniqueness: true
	validates :nombres, presence: true, length: {minimum: 3}
	validates :apellidos, presence: true, length: {minimum: 3}
	validates :es_egresado, presence: true, length: {maximum: 1, minimum: 1}
	validates :clave, presence: true, length: {minimum: 8}


end
