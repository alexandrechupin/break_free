class Motive < ApplicationRecord
  has_many :incident_motives
  has_many :non_profits
  validates :name, presence: true, uniqueness: true
end
