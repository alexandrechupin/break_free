class IncidentMotive < ApplicationRecord
  belongs_to :motive
  belongs_to :incident

end
