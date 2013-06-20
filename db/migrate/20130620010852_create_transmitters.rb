class CreateTransmitters < ActiveRecord::Migration
  def change
    create_table :transmitters do |t|
      t.string :object
      t.string :city
      t.string :place
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
