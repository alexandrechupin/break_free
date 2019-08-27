class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit, :update]
  before_action :set_incident

  def create
    @incident = Incident.new(incident_params)
    authorize @incident
    if @incident.save
      redirect_to incident_recommendations_path(@incident)
    else
      render :new
    end
  end

  def edit
  end

  def show
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
