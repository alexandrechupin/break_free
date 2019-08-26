class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.string :title
      t.text :description
      t.boolean :is_an_action

      t.timestamps
    end
  end
end
