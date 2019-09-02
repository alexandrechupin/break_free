class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @record.incident = @user.incident
  end

  def create?
    @record.incident = @user.incident
  end

  def create_complaint?
    true
  end

  def report_complaint?
    true
  end
end
