class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
    	t.integer :codigo
      	t.string :nombre
      	t.integer :creditos
      	t.references :semester, foreign_key: true
      	t.references :student, foreign_key: true, null: true
      	t.timestamps
    end
  end
end
