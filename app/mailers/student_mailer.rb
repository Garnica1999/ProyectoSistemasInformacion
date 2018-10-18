class StudentMailer < ApplicationMailer
	def new_student(student)
		@student = student
		mail(to: student.email, subject: 'Se ha registrado Correctamente')
	end

	def new_monitoring(student, subject)
		@student = student
		@subject = subject
		mail(to: student.mail, subject: 'Se ha inscrito a una monitoria')
	end
end
