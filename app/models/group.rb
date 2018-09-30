class Group < ApplicationRecord
  self.primary_key = "codigo", "subject"
  belongs_to :subject
  belongs_to :teacher
  belongs_to :student

  has_and_belongs_to_many :schedules
  has_many :notes


end
