class Report < ApplicationRecord
  belongs_to :incident
  mount_uploader :photo, PhotoUploader

end
