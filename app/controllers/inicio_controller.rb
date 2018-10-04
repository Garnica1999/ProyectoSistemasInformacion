class InicioController < ApplicationController
  before_action :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    #devise_parameter_sanitizer.permit(:sign_up) do |user|
    #  user.permit(:codigo, :documento, :nombres, :apellidos, :es_egresado, :email, :password, :password_confirmation)
    #end
    devise_parameter_sanitizer.permit(:sign_up, keys: [:codigo, :documento, :nombres, :apellidos, :es_egresado, :email, :password, :password_confirmation])
  end
  def index
  end
end
