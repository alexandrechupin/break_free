class ProofsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :destroy]
  before_action :set_incident, only: [:index, :new, :create, :destroy, :get_content_type]
  before_action :set_proof, only: [:destroy]

  def index
    @proofs = policy_scope(Proof)
    @proof = Proof.new
  end

  def create
    @proof = Proof.new(proof_params)
    @proof.incident = @incident
    @proof.content_type = params[:proof][:photo].content_type if params[:proof][:photo].content_type
    @proof.content_type = "attestation de temoin/pdf" if @proof.content_type == "application/pdf"
    @proof.original_filename = params[:proof][:photo].original_filename if params[:proof][:photo].original_filename
    authorize @proof

    if @proof.save
      redirect_to incident_proofs_path(@incident)
    else
      render :index
    end
  end

  def destroy
    @proof.destroy
    redirect_to incident_proofs_path(@incident)
    authorize @proof
  end

  def get_content_type
    @incident.proofs.pluck(:content_type).uniq.map do |type|
      type.split("/")[0]
    end
  end

  private

  def proof_params
    params.require(:proof).permit(:photo, :photo_cache, :public_id)
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def set_proof
    @proof = Proof.find(params[:id])
  end
end
