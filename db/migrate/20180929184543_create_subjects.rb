class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :nombre_materia
      t.integer :creditos
      t.references :semester, foreign_key: true

      t.timestamps
    end
  end
end
