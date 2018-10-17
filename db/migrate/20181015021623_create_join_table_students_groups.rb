class CreateJoinTableStudentsGroups < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :groups do |t|
      t.references :student, foreign_key: true
      t.references :group, foreign_key: true
    end
  end
end
