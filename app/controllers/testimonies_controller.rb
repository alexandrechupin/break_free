class TestimoniesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :set_incident, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]
  #before_action :set_proof, only: [:new, :create]

  def index
    @testimonies = policy_scope(Testimony)
    @testimony = Testimony.new
  end

  def new
    @testimony = Testimony.new

    # build 4 proofs: cerfa + 3 others
    4.times { @testimony.proofs.build }
    skip_authorization
  end

  def create
    @testimony = Testimony.new(testimony_params)
    @testimony.incident = @incident

    # set mandatory incident on proof
    @testimony.proofs.each do |proof|
      proof.incident = @incident
      next if proof.photo.blank?

      proof.content_type = proof.photo.content_type
      proof.original_filename = proof.photo.file.original_filename
    end

    skip_authorization

    if @testimony.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def testimony_params
    params.require(:testimony).permit(
      :witness_email,
      :witness_name,
      :witness_family_name,
      :witness_gdpr,
      proofs_attributes: [:photo]
    )
  end

  # def proof_params
  #  params.require(:proof).permit(:photo, :photo_cache)
  #end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def set_proof
    @proof = Proof.find(params[:proof_id])
  end
end
