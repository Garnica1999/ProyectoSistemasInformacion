class CreateJoinTableGroupsSchedules < ActiveRecord::Migration[5.1]
  def change
    create_join_table :groups, :schedules do |t|
      t.references :group, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :schedule, foreign_key: true
    end
  end
end
