class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
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

  def update_report?
    @record.incident = @user.incident
  end

  def update_complaint_report?
    @record.incident = @user.incident
  end

  def send_anonymous_report?
    true
  end
end
