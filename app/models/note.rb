class Note < ApplicationRecord
  self.primary_key = "group", "student", "subject"

  belongs_to :student
  belongs_to :group
  belongs_to :subject
end
