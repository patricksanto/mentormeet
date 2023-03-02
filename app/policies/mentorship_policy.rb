class MentorshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def create?
    user.admin
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def owner?
    # restaurant user should be the same as logged in user
    # @restaurant.user == current_user
    # raise
    record.user == user
  end
end
