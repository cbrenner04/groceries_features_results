class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :feature, foreign_key: true, null: false
      t.float :duration, null: false
      t.string :exception
      t.boolean :passed, null: false

      t.timestamps
    end
  end
end
