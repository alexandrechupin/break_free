class ProofPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(incident_id: @user.incident.id)
    end
  end

  def show?
    @record.incident = @user.incident
  end
end
