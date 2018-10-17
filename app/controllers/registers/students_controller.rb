class Registers::StudentsController < ApplicationController
	layout 'teachers'

	def show
		@students = Student.all
		@student = Student.find(params[:id])
		@esMonitor = Student.verificarEstudiante(params[:id])
		@program = Student.obtenerCarrera(params[:id])
		@school = Student.obtenerFacultad(params[:id])
		@pago = Student.calcularDescuentoMatricula(params[:id])
		@monitor = Student.esMonitor(params[:id])
	end
end
