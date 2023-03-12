class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :semester
  belongs_to :course

  validates_uniqueness_of :user_id, scope: :course_id
end