class AddDescToIncidentCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :incident_categories, :description, :string
  end
end
