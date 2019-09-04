class AddAudioToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :url, :string
  end
end
