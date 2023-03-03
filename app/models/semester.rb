class Semester < ApplicationRecord
  validates :name,  presence: true
  validates :name, uniqueness: true
  has_many :enrollments
  has_many :users, through: :enrollments

  enum current: { deactive: 0, active: 1 }
end
