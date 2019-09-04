class ChangeUrlToAudioInIncidents < ActiveRecord::Migration[5.2]
  def change
    rename_column :incidents, :url, :audio
  end
end
