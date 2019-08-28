class AddDetailsToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :description_after_feeling, :string
    add_column :incidents, :description_about_testimony, :string
  end
end
