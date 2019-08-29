class RenameMediaInProofs < ActiveRecord::Migration[5.2]
  def change
    rename_column :proofs, :media, :photo
  end
end
