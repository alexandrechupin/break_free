class Proof < ApplicationRecord
  belongs_to :incident
  belongs_to :testimony, optional: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

end
