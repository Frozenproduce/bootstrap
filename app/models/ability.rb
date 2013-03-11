class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.persisted?
      if user.has_role? :admin
        can :manage, :all
      else
        can :read, :all
      end
    else
      cannot :read, :all
    end
  end
end
