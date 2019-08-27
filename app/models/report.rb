class Report < ApplicationRecord
  belongs_to :incident
  validates :report_type, presence: true
end
