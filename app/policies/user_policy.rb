class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    if record.seller || record == user
      return true
    else
      return false
    end
  end

  def update?
    @user.admin
  end

  def destroy?
    @user.admin
  end

  def create?
    @user.admin
  end


end
