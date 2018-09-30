class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, {
    	:id => false,
    	:primary_key => :codigo
    } do |t|
      t.integer :codigo, null: false
      t.references :subject, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
