class NotebookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
      true
    end

  end
end
