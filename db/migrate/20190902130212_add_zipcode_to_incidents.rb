class AddZipcodeToIncidents < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :zipcode, :string
  end
end
