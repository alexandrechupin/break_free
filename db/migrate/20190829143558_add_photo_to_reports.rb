class AddPhotoToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :photo, :string
  end
end
