class CreateTableJoinStudentsSubjectsGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :table_join_students_subjects_groups do |t|
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :group, foreign_key: true
      t.decimal :nota
    end
  end
end
