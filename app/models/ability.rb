class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, Course
        can :manage, Semester
      else
        can :read, Course
        can :enroll, Course, user_id: user.id
        can :read, Semester
      end
    end
  end
end

