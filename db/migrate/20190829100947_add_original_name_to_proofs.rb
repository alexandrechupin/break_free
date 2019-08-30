class AddOriginalNameToProofs < ActiveRecord::Migration[5.2]
  def change
    add_column :proofs, :original_filename, :string
  end
end
