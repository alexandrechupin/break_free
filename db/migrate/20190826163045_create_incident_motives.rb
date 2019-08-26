class CreateIncidentMotives < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_motives do |t|
      t.references :motive, foreign_key: true
      t.references :incident, foreign_key: true

      t.timestamps
    end
  end
end
