class RecommendationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @incident = Incident.find(params[:incident_id])
    @recommendations = policy_scope(Recommendation)
    authorize @recommendations
    # @recommendations = Recommendation.all
    # @recommendations = Recommendation.all
    # @incident_category = IncidentCategory.find(@incident.incident_category_id)
    # @incident_recommendations = IncidentRecommendation.where(incident_category:)
  end
end
