class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :nombres
      t.string :apellidos
      t.string :especialidad
      t.string :usuario
      t.string :clave

      t.timestamps
    end
  end
end
