class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.time :start_time
      t.text :summry
      t.date :event_date
      t.string :location

      t.timestamps null: false
    end
  end
end
