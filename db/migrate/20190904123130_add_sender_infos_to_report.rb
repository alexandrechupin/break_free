class AddSenderInfosToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :sender_first_name, :string
    add_column :reports, :sender_last_name, :string
    add_column :reports, :sender_address, :string
    add_column :reports, :sender_city, :string
    add_column :reports, :sender_phone_number, :string
  end
end
