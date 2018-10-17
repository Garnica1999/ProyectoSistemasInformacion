class Academics::Students::SchedulesController < ApplicationController
	layout 'teachers'

	def historial
		@logs = Student.find(params[:student_id]).logs

	end

	def chistorial
		student = Student.find(params[:student_id])
		codigo_materia = params[:codigo_materia].to_s.split("-").at(0)
		promedio_carrera = params[:promedio_carrera]
		nota_materia = params[:nota_materia]

		if promedio_carrera != ""
			student.promedio_carrera = promedio_carrera	
		end
		if codigo_materia != "" and nota_materia != ""
			student.logs.create(subject_id: codigo_materia.to_i, semester_id: student.semesters.last.id.to_i, nota_final: nota_materia.to_f)
		else
			return
		end
		
		if student.save
			redirect_to historial_schedule_student_path
		else
			puts student.errors.inspect
		end
	end
end
