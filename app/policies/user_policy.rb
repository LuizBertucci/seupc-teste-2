class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def home?
    true
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

  def list?
    @user.admin
  end


end
