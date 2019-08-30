class Incident < ApplicationRecord
  PLACE_TYPE = ["dans la rue", "dans un lieu accueillant du public", "dans mon lieu de travail", "dans un lieu privé", "sur internet"]

  belongs_to :user, optional: true
  has_many :reports, dependent: :destroy
  has_many :testimonies, dependent: :destroy
  has_many :proofs, dependent: :destroy
  has_many :incident_motives, dependent: :destroy
  has_many :motives, through: :incident_motives, dependent: :destroy
  has_many :incident_recommendations, through: :incident_category
  belongs_to :incident_category

  validates :incident_category, presence: true
  validates :place_type, inclusion: { in: PLACE_TYPE }, allow_blank: true

  def get_recommendations
    self.incident_category.recommendations
  end
end
