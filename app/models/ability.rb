class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    # can :manage, :all # TO GIVE TEMPORARY ACCESS TO EVERYTHING FOR EVERYONE
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
      can :manage, User
      can :manege, Post
    end
  end
end
