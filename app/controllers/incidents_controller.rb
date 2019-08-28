class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_incident, only: [:edit, :update, :show]

  def create
    @incident = Incident.new
    @incident.author_is_victim = params[:author_is_victim]
    @incident.incident_category = IncidentCategory.find(params[:incident_category_id])
    if @incident.save
      redirect_to incident_recommendations_path(@incident)
    else
      render 'pages/home'
    end
  end

  def show
  end

  def edit

  end

  def update
    @user = current_user
    if @incident.update(incident_params)
      redirect_to incident_path(@incident)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def incident_params
    params.require(:incident).permit(:user, :description, :date, :recurrent, :author_is_victim, :address, :publication_agreement, :place_type, :incident_category, :description_after_feeling, :description_about_testimony)
  end

  def set_incident
    @incident = Incident.find(params[:id])
    authorize @incident
  end
end
