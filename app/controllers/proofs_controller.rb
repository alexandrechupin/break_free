class ProofsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :destroy]
  before_action :set_incident, only: [:index, :new, :create, :destroy]
  before_action :set_proof, only: [:destroy]

  def index
    @proofs = policy_scope(Proof)
    @proof = Proof.new
  end

  def create
    @proof = Proof.new(proof_params)
    @proof.incident = @incident
    @proof.content_type = params[:proof][:photo].content_type if params[:proof][:photo].content_type
    @proof.original_filename = params[:proof][:photo].original_filename if params[:proof][:photo].original_filename
    if @proof.save
      redirect_to incident_proofs_path(@incident)
    else
      render :index
    end
    authorize @proof
  end

  def destroy
    @proof.destroy
    redirect_to incident_proofs_path(@incident)
    authorize @proof
  end

  private

  def proof_params
    params.require(:proof).permit(:photo, :photo_cache)
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def set_proof
    @proof = Proof.find(params[:id])
  end
end
