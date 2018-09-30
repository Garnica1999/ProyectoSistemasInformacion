class CreateJoinTableSemesterPrograms < ActiveRecord::Migration[5.1]
  def change
    create_join_table :semesters, :programs do |t|
      t.references :semester, foreign_key: true
      t.references :program, foreign_key: true
      t.date :fecha_inicio
      t.date :fecha_fin
    end
  end
end
