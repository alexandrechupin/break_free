class ProofsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_incident, only: [:new, :create, :index]

  def index
    @proofs = policy_scope(Proof)
  end

  def new
  end

  def create
  end

  def incident_params
    params.require(:proof).permit(:media_url)
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end
end
