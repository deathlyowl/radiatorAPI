class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :transmitter_id
      t.string :name
      t.float :frequency
      t.integer :power

      t.timestamps
    end
  end
end
