class CreateNonProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :non_profits do |t|
      t.references :motive, foreign_key: true
      t.string :name
      t.string :contact_email
      t.text :description
      t.string :logo_url

      t.timestamps
    end
  end
end
