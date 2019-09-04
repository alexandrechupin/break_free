class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :stats, :about]

  def home
    @incident_categories = IncidentCategory.all
  end

  def stats
    @incidents = Incident.geocoded #returns flats with coordinates

    @markers = @incidents.map do |incident|
      {
        lat: incident.latitude,
        lng: incident.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { incident: incident }),
        image_url: helpers.asset_url('map-pin.svg')
      }
    end
  end

  def about
  end
end
