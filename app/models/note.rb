class Note < ApplicationRecord
  belongs_to :student
  belongs_to :subject
  belongs_to :group
end
