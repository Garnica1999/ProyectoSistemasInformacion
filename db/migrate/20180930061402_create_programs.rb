class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs, {
    	:id => false,
    	:primary_key => :nombre
    } do |t|
      	t.string :nombre
      	t.references :school, foreign_key: true
      	t.references :teacher, foreign_key: true

      	t.timestamps
    end
  end
end
