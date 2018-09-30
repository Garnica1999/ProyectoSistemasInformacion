# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def create
    @student = Student.new(
                codigo: params[:student][:codigo],
                documento: params[:student][:documento], 
                nombres: params[:student][:nombres], 
                apellidos: params[:student][:apellidos], 
                es_egresado: params[:student][:es_egresado],
                email: params[:student][:email],
                clave: params[:student][:clave], 
                promedio_carrera: 0.0)
    #@student = Student.new(params[student_params])
    if @student.save
      redirect_to @student
    else
      render :new
    end
  end
  #DELETE /students/:id
  def destroy
    @student =  Student.find(params[:id]) #
    @student.destroy #Destroy elimina el objeto de la base de datos
    redirect_to students_path
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
end
