class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :stats, :about]

  def home
    @incident_categories = IncidentCategory.all
    authorize @incident_categories
  end

  def stats
  end

  def about
  end
end
