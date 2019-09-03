class AddDetailsToTestimony < ActiveRecord::Migration[5.2]
  def change
    add_column :testimonies, :witness_email, :string
    add_column :testimonies, :witness_name, :string
    add_column :testimonies, :witness_family_name, :string
    add_column :testimonies, :witness_gdpr, :boolean
  end
end
