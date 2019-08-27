class Incident < ApplicationRecord
  PLACE_TYPE = ["rue", "lieu accueillant du public", "lieu de travail", "lieu privé", "internet"]

  belongs_to :user
  has_many :reports
  has_many :testimonies
  has_many :proofs
  has_many :incident_motives
  has_many :motives, through: :incident_motives
  has_many :incident_recommendations, through: :incident_category
  belongs_to :incident_category

  validates :date, presence: true
  validates :address, presence: true
  validates :incident_category, presence: true
  validates :place_type, presence: true, inclusion: { in: PLACE_TYPE }
  validates_associated :incident_motives
end
