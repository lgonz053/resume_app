class Capstone < ApplicationRecord
  validates :student, uniqueness: :true
  belongs_to :student
end
