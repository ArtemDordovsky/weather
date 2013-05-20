class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :temperature
      t.string :wind_direction
      t.string :humidity
      t.time :time
      t.timestamps
    end
  end
end
