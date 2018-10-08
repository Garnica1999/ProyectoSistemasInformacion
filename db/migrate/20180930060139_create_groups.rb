class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      	t.integer :codigo
      	t.references :subject, foreign_key: true
      	t.references :teacher, foreign_key: true, null: true
      	

      	t.timestamps
    end
  end
end
