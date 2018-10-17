class Subject < ApplicationRecord
  #self.primary_key = "codigo"
  belongs_to :semester
  belongs_to :student, optional: true
  has_many :groups
  has_many :notes
  has_many :logs

  def self.cargarMaterias
  	arr = Array.new
  	subjects = Subject.all
  	subjects.each do |subject|
  		arr.push(subject.id.to_s + "-" + subject.nombre)
  	end
  	return arr
  end

  def self.obtenerMateriaPorID(codigo)
    return Subject.find(codigo).nombre
  end
  
  def self.obtenerInfoMateria(id_subject)
    subject = Subject.find(id_subject)
    subjects = Array.new
    subjects.push(subject.codigo.to_s)
    subjects.push(subject.nombre)
    subjects.push(subject.creditos.to_s)
    return subjects
  end
end
