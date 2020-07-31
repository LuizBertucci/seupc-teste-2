class TagPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    current_user.admin
  end

  def edit?
    current_user.admin
  end

  def create?
    current_user.admin
  end

  def destroy?
    current_user.admin
  end
end
