class NonprofitsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_incident, only: [ :index, :get_content_type]

  def index
    authorize @incident, :show?
    @nonprofits = @incident.motives.map do |m|
      m.non_profits
    end.flatten.uniq
  end

  private

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end
end
