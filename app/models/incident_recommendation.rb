class IncidentRecommendation < ApplicationRecord
  belongs_to :incident_category
  belongs_to :recommendation
end
