class StudentsController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  before_action :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    #devise_parameter_sanitizer.permit(:sign_up) do |user|
    #  user.permit(:codigo, :documento, :nombres, :apellidos, :es_egresado, :email, :password, :password_confirmation)
    #end
    devise_parameter_sanitizer.permit(:sign_in, keys: [:codigo, :password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:codigo, :documento, :nombres, :apellidos, :es_egresado, :email, :password, :password_confirmation])
  end
  #GET /estudiante
  def index
  	#TRAER TODOS LOS REGISTROS DE LA TABLA Student
  	#Student.all
  	#PASAR DATOS A LA VISTA - OBTIENE TODOS LOS REGISTROS
  	#@students = Student.all
  end
  #GET /estudiante/:id
  def show 
    #ENCONTRAR REGISTRO POR EL ID
    @student = Student.find(params[:id])
  end
  #GET /estudiante/ver
  def ver
  	@students = Student.all
  end
  #GET /students/new
  def new
  	@student = Student.new
  end
  #/POST /students
  def create
  	#@student = Student.new(
    #            codigo: params[:student][:codigo],
    #            documento: params[:student][:documento], 
		#			  		nombres: params[:student][:nombres], 
		#			  		apellidos: params[:student][:apellidos], 
		#			  		es_egresado: params[:student][:es_egresado],
    #            email: params[:student][:email],
		#			  		encrypted_password: params[:student][:password], 
		#			  		promedio_carrera: 0.0)
    #@student = Student.new(params[student_params])
    #if @student.save
  	#	redirect_to @student
  	#end
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      puts @student.errors.inspect
      render :new
    end
  end
  #DELETE /students/:id
  def destroy
  	@student = 	Student.find(params[:id]) #
  	@student.destroy #Destroy elimina el objeto de la base de datos
  	redirect_to students_path
  end
  #PUT /students/:id
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end


  private

  def student_params
  	params.require(:student).permit(:email, :password, :password_confirmation, :nombres, :apellidos, :codigo, :documento, :es_egresado)
  end

end
