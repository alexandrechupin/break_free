class IncidentCategory < ApplicationRecord
  has_many :incident_recommendations
  has_many :incidents
  validates :name, presence: true, uniqueness: true
end
