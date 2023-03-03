class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { student: 0, admin: 1 }
  has_many :enrollments
  has_many :semesters, through: :enrollments
  has_many :courses, through: :enrollments
  has_one :profile
end
