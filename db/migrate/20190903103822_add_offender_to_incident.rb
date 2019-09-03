class AddOffenderToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :offender, :string
  end
end
