class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools, {
    	:id => false,
    	:primary_key => :nombre
    }do |t|
      t.string :nombre
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
