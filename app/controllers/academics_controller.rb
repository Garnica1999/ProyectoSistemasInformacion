class AcademicsController < ApplicationController
	layout 'teachers'
	def index
		@notifications = Notification.all.where(solucionado: 0)
	end
end
