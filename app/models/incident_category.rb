class IncidentCategory < ApplicationRecord
  has_many :incident_recommendations
  has_many :recommendations, through: :incident_recommendations
  has_many :incidents
  has_many :recommendations, through: :incident_recommendations
  validates :name, presence: true, uniqueness: true
end
