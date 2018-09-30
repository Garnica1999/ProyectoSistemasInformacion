class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters, {
    	:id => false,
    	:primary_key => :semestre
    } do |t|
    	t.integer :semestre
    	t.date :fecha_inicio
    	t.date :fecha_fin
    	t.timestamps
    end
  end
end
