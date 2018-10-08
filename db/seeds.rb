# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

school = School.new(nombre: "Ingenieria")
school.save
school.programs.create(nombre: "Sistemas", matricula: 4500000.0)
school.programs.create(nombre: "Electronica", matricula: 4200000.0)

school = School.new(nombre: "Arquitectura")
school.save
school.programs.create(nombre: "Arquitectura", matricula: 4500000.0)

semestre = Semester.new(semestre: 7, fecha_inicio: '2018-07-27', fecha_fin: '2018-11-20')
semestre.save

subject = semestre.subjects.new(codigo: 1256, nombre: "Sistemas de Informacion", creditos: 4)
subject.save
subject.groups.create(codigo: 1233)

subject = semestre.subjects.new(codigo: 1260, nombre: "Programacion", creditos: 3)
subject.save
subject.groups.create(codigo: 1234)

subject = semestre.subjects.new(codigo: 1270, nombre: "Matematicas", creditos: 10)
subject.save
subject.groups.create(codigo: 1235)

subject = semestre.subjects.new(codigo: 1280, nombre: "Ingenieria Web", creditos: 10)
subject.save
subject.groups.create(codigo: 1236)

note = Note.new(student_id: 1, group_id: 1, subject_id: 1, nota: 4.5)
note.save

note = Note.new(student_id: 1, group_id: 2, subject_id: 2, nota: 3.5)
note.save

note = Note.new(student_id: 1, group_id: 3, subject_id: 3, nota: 3.8)
note.save

note = Note.new(student_id: 1, group_id: 4, subject_id: 4, nota: 4.2)
note.save

note = Note.new(student_id: 1, group_id: 1, subject_id: 1, nota: 5.0)
note.save

note = Note.new(student_id: 1, group_id: 2, subject_id: 2, nota: 4.9)
note.save

note = Note.new(student_id: 1, group_id: 3, subject_id: 3, nota: 4.1)
note.save

note = Note.new(student_id: 1, group_id: 4, subject_id: 4, nota: 2.0)
note.save

log = Log.new(student_id: 1, subject_id: 1, semester_id: 1, nota_final: 4.8)
log.save

log = Log.new(student_id: 1, subject_id: 2, semester_id: 1, nota_final: 4.2)
log.save

log = Log.new(student_id: 1, subject_id: 3, semester_id: 1, nota_final: 4.3)
log.save

log = Log.new(student_id: 1, subject_id: 4, semester_id: 1, nota_final: 3.9)
log.save
