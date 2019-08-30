class AddContentToProofs < ActiveRecord::Migration[5.2]
  def change
    add_column :proofs, :content_type, :string
  end
end
