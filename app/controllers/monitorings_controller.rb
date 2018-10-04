class MonitoringsController < ApplicationController
	layout 'students'
	def index
		redirect_to ver_student_monitoring_path(current_student)
	end

	def ver
		#@groups = Group.joins(:subject).where.not(student_id: nil)
		@groups = Group.joins(:subject).where(student_id: nil)
	end

end
