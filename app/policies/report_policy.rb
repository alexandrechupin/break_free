class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    true
  end

  def create_complaint?
    true
  end

  def report_complaint?
    true
  end
end
