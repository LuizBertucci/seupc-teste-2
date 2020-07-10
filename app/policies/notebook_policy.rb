class NotebookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def update?
      record.user == user
    end

    def create?
      true
    end

  end
end
