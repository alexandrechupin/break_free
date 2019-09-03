class AddRecipientEmailToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :recipient_email, :string
  end
end
