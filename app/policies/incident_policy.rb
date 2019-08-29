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

  def modify_event?
    record.user == user
  end

  def update?
    record.user == user
  end

  def update_event?
    record.user == user
  end
end
