class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.integer :semestre
      t.date :fecha_inicio
      t.date :fecha_fin

      t.timestamps
    end
  end
end
