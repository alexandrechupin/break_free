class AddTribunalToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_reference :incidents, :tribunal, foreign_key: true
  end
end
