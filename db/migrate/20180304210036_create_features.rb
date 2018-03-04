class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :rspec_id, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
