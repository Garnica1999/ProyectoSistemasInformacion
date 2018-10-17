class Academics::SubjectsController < ApplicationController
	layout 'teachers'

	def index
		@subjects = Subject.all
	end
	def show
		@subjects = Subject.all
		@subject = Subject.find(params[:id])
	end

	def new
		@subjects = Subject.all
		@subject = Subject.new
	end

	def create
		semestre = params[:subject][:semester_id].split("-").at(0)
		@subject = Subject.new(subject_params)
		@subject.semester_id = semestre
		if @subject.save
			redirect_to academics_subjects_path
		else
			puts @subject.errors.inspect
			render :new
		end
	end

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		semestre = params[:subject][:semester_id].split("-").at(0)
		@subject = Subject.new(subject_params)
		@subject.semester_id = semester_id
		if @subject.save
			redirect_to academics_subjects_path
		else
			puts @subject.errors.inspect
			render :new
		end
	end

	def subject_params
  	params.require(:subject).permit(:codigo, :nombre, :creditos, :semester_id)
  end

end
