class Recommendation < ApplicationRecord
  has_many :incident_recommendations
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
