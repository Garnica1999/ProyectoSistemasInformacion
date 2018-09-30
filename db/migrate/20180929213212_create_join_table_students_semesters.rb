class CreateJoinTableStudentsSemesters < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :semesters do |t|
      t.references :student, foreign_key: true
      t.references :semester, foreign_key: true
    end
  end
end
