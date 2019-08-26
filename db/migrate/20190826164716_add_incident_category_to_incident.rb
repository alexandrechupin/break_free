class AddIncidentCategoryToIncident < ActiveRecord::Migration[5.2]
  def change
    add_reference :incidents, :incident_category, foreign_key: true
  end
end
