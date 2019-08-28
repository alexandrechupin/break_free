class RecommendationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @recommendations = policy_scope(Recommendation)
    authorize @recommendations
    @incident = Incident.find(params[:incident_id])
    @recommendations = @incident.get_recommendations
  end
end
