# frozen_string_literal: true

class DeviseCreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      ## Database authenticatable
      t.integer :codigo, null: false
      t.integer :documento, null: false
      t.string :nombres, null: false
      t.string :apellidos, null: false
      t.integer :es_egresado, null: false
      t.decimal :promedio_carrera, null: true, default: 0.0
      t.decimal :matricula, null: true, default: 0.0
      t.string :email, null: false
      t.string :encrypted_password, null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :students, :email,                unique: true
    add_index :students, :reset_password_token, unique: true
    add_index :students, :documento, unique: true
    add_index :students, :codigo, unique: true
    # add_index :students, :confirmation_token,   unique: true
    # add_index :students, :unlock_token,         unique: true
  end
end