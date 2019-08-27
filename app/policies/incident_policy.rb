class IncidentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end

  def home?
    return true
  end

  def create?
    return true
  end
end
