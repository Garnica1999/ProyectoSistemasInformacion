class Students::MonitoringController < ApplicationController
  layout 'students'
  def index
  	
  end
  
  def login
	if request.get?
		session[:user_id] = nil
		@user = Student.new
	else
		@user = Student.new(params[:user])
		logged_in_user = @user.try_to_login
					
		if logged_in_user
			session[:user_id] = logged_in_user.id
			redirect_to(:action => "index")
		else
			flash[:notice] = "Invalid user/password combination"
			end
		end
	end
end
