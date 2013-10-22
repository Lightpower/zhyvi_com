class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Abilities for guests
    can :read, Article
    can :read, Feedback
    can :read, Event

    if user.is_admin?
      can :manage, :all
    elsif user.present?
      can :manage, User,        id: user.id
      can :manage, FileLink,    user_id: user.id
      can :create, Feedback
    end
  end
end
