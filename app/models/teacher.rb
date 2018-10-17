class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :schools
  has_many :programs

  def self.opciones_especialidad
    arr = Array.new
    arr.push("Docente")
    arr.push("Director")
    arr.push("Administrador")
    return arr
  end
  
  def self.cargarProfesores
    arr = Array.new
    teachers = Teacher.all
    teachers.each do |teacher|
      arr.push(teacher.id.to_s + "-" + teacher.nombres + " " + teacher.apellidos)
    end
    return arr
  end

  def self.obtenerNombresPorID(codigo)
    teacher = Teacher.find(codigo)
    return teacher.nombres + " " + teacher.apellidos
  end

end
