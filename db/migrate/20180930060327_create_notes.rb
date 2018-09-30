class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes, {
    	:id => false,
    	:primary_key => :student
    } do |t|
      t.references :student, foreign_key: true
      t.references :group, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
