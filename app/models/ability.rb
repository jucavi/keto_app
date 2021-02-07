class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    # can :manage, :all
    if user
      can :crud, Recipe, user_id: user.id
    end

    user ||= User.new
    can :read, Recipe

    if user.superadmin_role?
      can :manage, :all
      can :access, :rails_admin
      can :manage, :dashboard
    end

    if user.supervisor_role?
      can :manage, Recipe
    end
  end
end
