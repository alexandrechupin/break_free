class CreateTribunals < ActiveRecord::Migration[5.2]
  def change
    create_table :tribunals do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :timings
      t.string :url
    end
  end
end
