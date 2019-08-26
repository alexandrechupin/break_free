class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :incident, foreign_key: true
      t.string :report_type

      t.timestamps
    end
  end
end
