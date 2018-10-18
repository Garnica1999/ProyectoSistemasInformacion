class Notification < ApplicationRecord
  belongs_to :student

  def self.crearNotificacion(tipo, accion, url, solucionado, id_student)
  	notification = Notification.new(tipo: tipo, accion: accion, student_id: id_student, url: url, solucionado: solucionado)
  	notification.save
  end
end
