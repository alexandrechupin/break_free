class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @incident = Incident.new
    authorize @incident
  end
end
