class CreateTestimonies < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonies do |t|
      t.references :incident, foreign_key: true
      t.string :cerfa_url

      t.timestamps
    end
  end
end
