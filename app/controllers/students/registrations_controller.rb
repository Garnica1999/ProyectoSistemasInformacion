# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  layout 'students'
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  
  #POST /resource
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
      redirect_to @student
    else
      puts @student.errors.inspect
      render :new
    end
  end

def edit
  @student = Student.find(params[:id])
end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def student_params
    params.require(:student).permit(:email, :password, :password_confirmation, :nombres, :apellidos, :codigo, :documento, :es_egresado)
  end
end
