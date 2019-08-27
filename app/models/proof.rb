class Proof < ApplicationRecord
  belongs_to :incident
  belongs_to :testimony
  validates :media_url, presence: true
end
