class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes, {
    	:id => false,
    	:primary_key => :student
    } do |t|
      t.references :student, foreign_key: true, null: false
      t.references :group, foreign_key: true, null: false
      t.references :subject, foreign_key: true, null: false
      t.decimal :nota, null:false

      t.timestamps
    end
  end
end
