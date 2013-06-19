class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :genre
      t.string :shortcut

      t.timestamps
    end
  end
end
