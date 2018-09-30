class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :dia, null:false
      t.string :hora, null: false

      t.timestamps
    end
  end
end
