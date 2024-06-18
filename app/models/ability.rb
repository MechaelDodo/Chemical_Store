# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin
      can :manage, :all
    elsif user.worker
      can :read, Product
      can :read, Stock
      cannot :all, User
      cannot [:create, :update, :destroy], Stock
      cannot [:create, :update, :destroy], Product
      can [:update], ProductStock
    elsif user.cashier
      can :read, Product
      can :read, Stock
      cannot :all, User
      cannot [:create, :update, :destroy], Stock
      cannot [:create, :update, :destroy], Product
      cannot [:update], ProductStock
    elsif user.regular
      can :read, Product
      #cannot :read, Product, format: :json if user.regular
      cannot :read, Stock
      cannot :all, User
      cannot [:create, :update, :destroy], Stock
      cannot [:create, :update, :destroy], Product
      cannot :all, ProductStock
    end


    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
