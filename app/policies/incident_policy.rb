class IncidentPolicy < ApplicationPolicy
  # scope ~= Incident
  # record == <Incident>
  # user == current_user
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def edit?
    return true
  end
end
