class AddCoordinatesToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :latitude, :float
    add_column :incidents, :longitude, :float
  end
end
