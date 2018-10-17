class RegistersController < ApplicationController
	layout 'teachers'

	def index
		@students = Student.all
	end
end
