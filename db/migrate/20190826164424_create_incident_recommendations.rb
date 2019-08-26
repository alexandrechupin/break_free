class CreateIncidentRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_recommendations do |t|
      t.references :incident_category, foreign_key: true
      t.references :recommendation, foreign_key: true

      t.timestamps
    end
  end
end
