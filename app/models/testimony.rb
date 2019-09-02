class Testimony < ApplicationRecord
  belongs_to :incident
  has_many :proofs
  accepts_nested_attributes_for :proofs, reject_if: proc { |attributes| attributes['photo'].blank? }
  #validates :cerfa_url, presence: true
end
