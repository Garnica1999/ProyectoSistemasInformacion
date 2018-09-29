class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :dia
      t.string :hora

      t.timestamps
    end
  end
end
