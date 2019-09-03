class AddWitnessToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :witness, :boolean
  end
end
