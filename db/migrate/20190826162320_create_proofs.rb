class CreateProofs < ActiveRecord::Migration[5.2]
  def change
    create_table :proofs do |t|
      t.references :incident, foreign_key: true
      t.references :testimony, foreign_key: true
      t.string :media_url

      t.timestamps
    end
  end
end
