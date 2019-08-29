class ProofsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_incident, only: [:new, :create, :index]

  def index
    @proofs = policy_scope(Proof)
    @proof = Proof.new
  end

  def create
    @proof = Proof.new(proof_params)
    @proof.incident = @incident
    if @proof.save
      redirect_to incident_proofs_path(@incident)
    else
      render 'index'
    end
    authorize @proof
  end

  private

  def proof_params
    params.require(:proof).permit(:photo, :photo_cache)
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end
end
