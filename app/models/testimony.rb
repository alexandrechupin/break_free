class Testimony < ApplicationRecord
  belongs_to :incident
  has_many :proofs
  validates :cerfa_url, presence: true
end
