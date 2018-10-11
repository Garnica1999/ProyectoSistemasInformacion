class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :validatable
	has_many :subjects
	has_many :notes
	has_many :logs

	#RELACION MUCHOS A MUCHOS
	has_and_belongs_to_many :semesters

	@@PAGO_MONITOR_PREGRADO = 500000.0
	@@PAGO_MONITOR_POSTGRADO = 750000.0
	
	def self.calc_credits(id_student)
		credits = 0
		logs = Student.find(id_student).logs
		logs.each do |log|
			credits = credits + log.subject.creditos
		end
		return credits
	end

	def self.ingresarMonitoria(id_student, cod_subject)
		subject = Subject.find_by(codigo: cod_subject)
		subject.student_id = id_student
		if subject.save
			return "Monitoria asignada correctamente"
		else
			return subject.errors.inspect + " " + "La monitoria no se ha asignado correctamente. Intente mas tarde o contacte con soporte"
		end
	end

	def self.buscarMateriaDisponible(id_student,cod_subject)
		cantidad = Subject.where(student_id: id_student, codigo: cod_subject).size
		return cantidad == 0
	end

	def self.vioCurso(id_student, cod_subject)

		#puts id_student
		#puts cod_subject
		#logs = Student.find(id_student).logs
		#encontrado = false
		#logs.each do |log|
		#	codigo = Subject.find(log.subject_id).codigo
		#	if codigo == cod_subject
		#		encontrado = true
		#	end
		#end
		#return encontrado
		subject_ids = Log.where(student_id: id_student).pluck(:subject_id)
		return Subject.where(id: subject_ids, codigo: cod_subject).count  > 0
	end

	def self.calcPromedio(id_student)
		student = Student.find(id_student)
		#EL ESTUDIANTE TIENE UN PROMEDIO DE MAS DE 3.8 Y ES ESTUDIATE?
		if student.promedio_carrera >= 3.8 and student.es_egresado == 0
			return true
		#EL ESTUDIANTE TIENE UN PROMEDIO DE MAS DE 4.2 Y ES EGRESADO?
		elsif student.promedio_carrera >= 4.2 and student.es_egresado == 1
			return true
		else
			return false
		end
	end

	def self.verificarEstudiante(id_student)
		return Subject.where(student_id: id_student).count == 0
	end

	def self.descontarMatricula(id_student)
		student = Student.find(id_student)
		if student.es_egresado == 0 #ES ESTUDIANTE
			student.matricula -= @@PAGO_MONITOR_PREGRADO
			@pago = @@PAGO_MONITOR_PREGRADO
		else
			student.matricula -= @@PAGO_MONITOR_POSTGRADO
			@pago = @@PAGO_MONITOR_POSTGRADO
		end

		if student.save
			puts 'Se ha descontado correctamente'
			return true
		else
			puts 'No se pudo descontar correctamente, El descuento fallo'
			return false
		end
	end

	def self.calcularDescuentoMatricula(id_student)
		student = Student.find(id_student)
		if student.es_egresado == 0
			return @@PAGO_MONITOR_PREGRADO
		else
			return @@PAGO_MONITOR_POSTGRADO
		end
	end

	def self.crearContrato(id_student, cod_materia)

	end

	def self.opciones_programa
		arr = Array.new
		#schools = School.all.pluck(:id, :nombre)
		#Program.where(school_id: schools)
		schools = School.all
		
		schools.each do |school|
			cad = ""
			cad = school.nombre
			programs = Program.where(school_id: school)
			programs.each do |program|
				prog = cad + "-" +program.nombre
				arr.push(prog)
			end
		end
		return arr
	end

	def self.obtenerFacultad(id_student)
		id_program = Student.find(id_student).programa
		school = Program.find(id_program).school
		return school.nombre
	end

	def self.obtenerCarrera(id_student)
		id_program = Student.find(id_student).programa
		program = Program.find(id_program)
		return program.nombre
	end
end