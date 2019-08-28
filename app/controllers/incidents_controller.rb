class IncidentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :event, :localisation, :update_init, :update_init_geo, :assign_user]
  skip_after_action :verify_authorized, only: [:new, :create, :event, :localisation, :update_init, :update_init_geo, :assign_user]
  before_action :set_incident, only: [:update, :edit, :show]
  before_action :sign_up_user!, only: :assign_user

  def create
    @incident = Incident.new
    @incident.author_is_victim = params[:author_is_victim]
    @incident.incident_category = IncidentCategory.find(params[:incident_category_id])
    if @incident.save
      redirect_to event_incident_path(@incident)
    else
      render 'pages/home'
    end
  end

  def show
  end

  def event
    set_incident_init
    @motives = Motive.all
  end

  def localisation
    set_incident_init
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

  def update_init
    if params[:incident][:motive].nil?
      redirect_to event_incident_path, alert: 'Merci de spécifier au moins un motif'
    else
      set_incident_init
      incident_motives = params[:incident][:motive]
      incident_motives.each do |incident_motive|
        motive_id = Motive.find_by(name: incident_motive).id
        incident_motive = IncidentMotive.new(incident_id: params[:id], motive_id: motive_id)
        incident_motive.save
      end
      if @incident.update(incident_params)
        redirect_to localisation_incident_path
      else
        redirect_to event_incident_path, alert: 'Erreur'
      end
    end
  end

  def update_init_geo
    set_incident_init
    if @incident.update(incident_params)
      redirect_to incident_recommendations_path(@incident)
    else
      redirect_to localisation_incident_path, alert: 'Erreur'
    end
  end

  def assign_user
    set_incident_init
    @incident.user = current_user
    @incident.save
    redirect_to incident_path(@incident)
  end

  def destroy
  end

  private

  def sign_up_user!
    redirect_to(new_user_registration_path) unless user_signed_in?
  end

  def incident_params
    params.require(:incident).permit(:user, :description, :date, :recurrent, :author_is_victim, :address, :publication_agreement, :place_type, :incident_category, :description_after_feeling, :description_about_testimony)
  end

  def set_incident_init
    @incident = Incident.find(params[:id])
  end

  def set_incident
    @incident = Incident.find(params[:id])
    authorize @incident
  end
end
