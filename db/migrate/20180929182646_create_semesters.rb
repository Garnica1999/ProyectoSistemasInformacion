class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters,{
    	:id => false,
    	:primary_key => :semestre
    } do |t|
      t.integer :semestre, null: false
      t.date :fecha_inicio, null: false
      t.date :fecha_fin, null: false

      t.timestamps
    end
    add_index :semesters, :fecha_inicio, unique: true
    add_index :semesters, :fecha_fin, unique: true
  end
end
