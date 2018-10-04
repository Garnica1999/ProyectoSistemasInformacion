# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

semestre = Semester.new(semestre: 7, fecha_inicio: '2018-07-27', fecha_fin: '2018-11-20')
semestre.save
subject = semestre.subjects.new(codigo: 1256, nombre: "Sistemas de Informacion", creditos: 4)
subject.save
subject.groups.create(codigo: 1233)