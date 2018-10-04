# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  #
  #skip_before_filter :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_in
  layout 'students'
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:codigo, :password)
    end
  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || students_path
  end
  def after_sign_out_path_for(resource_or_scope)
    new_student_session_path
  end 

end
