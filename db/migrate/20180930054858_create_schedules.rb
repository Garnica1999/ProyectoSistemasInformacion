class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
    	t.string :dia
    	t.string :hora_inicio
    	t.string :hora_fin
      	t.timestamps
    end
  end
end
