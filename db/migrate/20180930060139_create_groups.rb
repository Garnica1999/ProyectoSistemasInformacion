class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      	t.integer :codigo, null: false
      	t.references :subject, foreign_key: true
      	t.references :teacher, foreign_key: true, null: true
      	

      	t.timestamps
      	
    end
    add_index :groups, :codigo,                unique: true
  end
end
