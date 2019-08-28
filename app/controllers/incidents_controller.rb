class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit, :update]
  before_action :set_incident, except: [:create]

  def create
    @incident = Incident.new
    authorize @incident
    @incident.author_is_victim = params[:author_is_victim]
    @incident.incident_category = IncidentCategory.find(params[:incident_category_id])
    if @incident.save
      redirect_to incident_recommendations_path(@incident)
    else
      render 'pages/home'
    end
  end

  def edit
  end

  def show
    @incident = Incident.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def incident_params
    params.require(:incident).permit(:user, :description, :date, :recurrent, :author_is_victim, :address, :publication_agreement, :place_type, :incident_category)
  end

  def set_incident
    @incident = Incident.find(params[:id])
  end
end
