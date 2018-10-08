class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :semester, foreign_key: true
      t.decimal :nota_final, null: false

      t.timestamps
    end
  end
end
