class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.date :date
      t.boolean :recurrent
      t.boolean :author_is_victim
      t.string :address
      t.boolean :publication_agreement
      t.string :place_type

      t.timestamps
    end
  end
end
