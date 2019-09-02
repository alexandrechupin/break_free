class TestimonyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(incident_id: @user.incident.id)
    end

    def new?
      create?
    end

    def create?
      true
    end

    def destroy?
      true
    end
  end
end
