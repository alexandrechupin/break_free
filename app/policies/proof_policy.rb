class ProofPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(incident_id: @user.incident.id)
    end
  end

  def show?
    @record.incident = @user.incident
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
