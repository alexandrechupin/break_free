class IncidentCategory < ApplicationRecord
  has_many :incident_recommendations
  validates :name, presence: true, uniqueness: true
end
