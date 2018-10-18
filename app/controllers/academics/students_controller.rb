class Academics::StudentsController < ApplicationController
	layout 'teachers'
	def index
		if !teacher_signed_in?
			redirect_to new_teacher_session_path
		end
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		program = params[:student][:programa]
		sem = params[:student][:semesters]
		@student = Student.new(student_params)

		programs = Program.where(nombre: program.split("-").at(1))
		semester = Semester.find(sem)
		@student.semesters << semester
		programs.each do |program|
			@student.programa = program.id
			@student.matricula = program.matricula.to_f
		end
		
		if @student.save
			StudentMailer.new_student(student).deliver_now
			redirect_to @student
		else
			puts @student.errors.inspect
			render :new
		end
	end

	def update
        program = params[:student][:programa]
	    sem = params[:student][:semesters]
	    @student = Student.find(params[:id])

	    programs = Program.where(nombre: program.split("-").at(1))
	    semester = Semester.find(sem)
	    @student.semesters << semester
	    programs.each do |program|
	      @student.programa = program.id
	      @student.matricula = program.matricula.to_f
	    end
    
	    if @student.update(student_params)
	      redirect_to @student.id
	    else
	      render :new
		end
	end

	def edit
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	private

	  def student_params
	    params.require(:student).permit(:email, :password, :password_confirmation, :nombres, :apellidos, :codigo, :documento, :es_egresado)
	  end
end
