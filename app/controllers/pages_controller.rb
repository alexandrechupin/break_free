class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :stats, :about]

  def home
    @incident = Incident.new
    authorize @incident
  end

  def stats
  end

  def about
  end
end
