class TeachersController < ApplicationController
	layout 'teachers'
	def index
		if teacher_signed_in?
			if current_teacher.especialidad == "Docente"
				redirect_to teacher_path(current_teacher)
			elsif current_teacher.especialidad == "Directivo"
			elsif current_teacher.especialidad == "Administrador"
				redirect_to academics_path
			end
		else
			redirect_to new_teacher_session_path
		end
	end
	def show
		@teacher = Teacher.find(params[:id])
	end
end
