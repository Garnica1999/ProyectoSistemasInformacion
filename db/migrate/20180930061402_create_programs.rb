class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      	t.string :nombre
      	t.references :school, foreign_key: true
      	t.references :teacher, foreign_key: true, null: true
      	t.decimal :matricula, null: true, default: 0.0

      	t.timestamps
    end
  end
end
