class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, Course
      else
        can :read, Course
      end
    end
  end
end

