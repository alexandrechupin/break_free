class Incident < ApplicationRecord
  PLACE_TYPE = ["dans la rue", "dans un lieu accueillant du public", "dans mon lieu de travail", "dans un lieu privé", "sur internet"]

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
    if self.place_type == PLACE_TYPE[1] || self.place_type == PLACE_TYPE[2]
      self.recommendations << Recommendation.find_by_title("Transmettre un rapport anonyme à l'établissement concerné")
    end
  end
end
