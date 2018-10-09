class MonitoringsController < ApplicationController
	layout 'students'
	def index
		redirect_to ver_student_monitoring_path(current_student)
	end

	def ver
		#@groups = Group.joins(:subject).where.not(student_id: nil)
		@subjects = Subject.where(student_id: nil)
		@student = Student.find(params[:student_id])
	end 

	def inscribir
		@student = Student.find(params[:student_id])
		puts params[:codigo_materia]
		grupoDisponible = Student.buscarMateriaDisponible(params[:student_id],params[:codigo_materia].to_i)
		vioMateria = Student.vioCurso(params[:student_id], params[:codigo_materia].to_i)
		cumplePromedio = Student.calcPromedio(params[:student_id])
		creditos = Student.calc_credits(params[:student_id])
		estSinMonitoria = Student.verificarEstudiante(params[:student_id])

		@mensaje = Array.new
		@todoBien = true
		if !grupoDisponible
			@todoBien = false
			@mensaje.push("El grupo ya tiene monitor disponible.")
			puts "El grupo ya tiene monitor disponible."
		end
		if !vioMateria
			@todoBien = false
			@mensaje.push("El estudiante no ha visto la materia aun")
			puts "El estudiante no ha visto la materia aun"
		end
		if !cumplePromedio
			@todoBien = false
			@mensaje.push("El estudiante no cumple el promedio requerido ser monitor")
			puts "El estudiante no cumple el promedio requerido ser monitor"
		end
		if creditos < 22
			@todoBien = false
			@mensaje.push("El estudiante no cumple con los minimos creditos vistos.")
			puts "El estudiante no cumple con los minimos creditos vistos."
		end

		if !estSinMonitoria
			@todoBien = false
			@mensaje.push("El estudiante ya tiene una materia como monitor, no puede inscribirse en mas materias")
			puts "El estudiante ya tiene una materia como monitor, no puede inscribirse en mas materias"
		end

		if @todoBien
			@mensaje.push(Student.ingresarMonitoria(params[:student_id], params[:codigo_materia].to_i))
			puts @mensaje
			if Student.descontarMatricula(params[:student_id])
				@mensaje.push("Se ha descontado " + @pago.to_s + " a la matricula.")
				@mensaje.push("Nuevo pago de matricula: " + current_student.matricula.to_s)
			else
				@mensaje.push("No se pudo descontar la matricula, contactese con la Universidad para mas informacion")
			end
		end
	end
end
