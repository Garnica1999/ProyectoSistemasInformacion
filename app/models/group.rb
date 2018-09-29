class Group < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  belongs_to :student

  has_many :notes

  has_and_belongs_to_many :schedules
end
