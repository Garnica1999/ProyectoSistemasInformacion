class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects, {
    	:id => false,
    	:primary_key => :codigo
    } do |t|
      t.string :codigo, null: false
      t.string :nombre_materia, null:false
      t.integer :creditos, null:false
      t.references :semester, foreign_key: true

      t.timestamps
    end
  end
end
