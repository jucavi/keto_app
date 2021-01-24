class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # can :manage, Recipe, user_id: user.id

    if user.superadmin_role?
      can :manage, :all
      can :access, :rails_admin
      can :manage, :dashboard
    end

    if user.supervisor_role?
      can :manage, User
      can :manege, Post
    end
  end
end
