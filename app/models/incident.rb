class Incident < ApplicationRecord
  PLACE_TYPE = ["rue", "lieu accueillant du public", "lieu de travail", "lieu privé", "internet"]

  belongs_to :user, optional: true
  has_many :reports
  has_many :testimonies
  has_many :proofs
  has_many :incident_motives
  has_many :motives, through: :incident_motives
  has_many :incident_recommendations, through: :incident_category
  belongs_to :incident_category

  validates :incident_category, presence: true
  validates :place_type, inclusion: { in: PLACE_TYPE }, allow_blank: true

  def get_recommendations
    self.incident_category.recommendations
  end
end
