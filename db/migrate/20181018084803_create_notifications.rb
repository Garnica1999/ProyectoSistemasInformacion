class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :tipo
      t.string :accion
      t.references :student, foreign_key: true
      t.string :url
      t.integer :solucionado

      t.timestamps
    end
  end
end
