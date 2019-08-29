class RenameMediaurlInProofs < ActiveRecord::Migration[5.2]
  def change
    rename_column :proofs, :media_url, :media
  end
end
