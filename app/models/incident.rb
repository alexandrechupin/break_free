class Incident < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  PLACE_TYPE = ["dans la rue", "dans un lieu accueillant du public", "dans mon lieu de travail", "dans un lieu privé", "sur internet"]

  belongs_to :user, optional: true
  belongs_to :tribunal, optional: true
  has_many :reports, dependent: :destroy
  has_many :testimonies, dependent: :destroy
  has_many :proofs, dependent: :destroy
  has_many :incident_motives, dependent: :destroy
  has_many :motives, through: :incident_motives, dependent: :destroy
  has_many :incident_recommendations, through: :incident_category
  belongs_to :incident_category

  validates :incident_category, presence: true
  validates :place_type, inclusion: { in: PLACE_TYPE }, allow_blank: true

  mount_uploader :audio, AudioUploader

  def get_recommendations
    recommendations = incident_category.recommendations.to_a
    # garder le to_a pour eviter d'inserer une nouvelle association en db
    if place_type == PLACE_TYPE[1] || place_type == PLACE_TYPE[2]
      recommendations << Recommendation.find_by_title("Transmettre un rapport anonyme à l'établissement concerné")
    end
    recommendations
  end

  def get_content_type
    content_array = self.proofs.pluck(:content_type).uniq.map do |type|
      type.split("/")[0]
    end
    content_array.join(', ')
  end
end
