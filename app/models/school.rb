class School < ApplicationRecord
  belongs_to :teacher

  has_many :programs
end
