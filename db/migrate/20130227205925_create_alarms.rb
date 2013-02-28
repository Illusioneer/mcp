class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :name
      t.string :category
      t.timestamp :startdate
      t.timestamp :enddate
      t.hstore :notify
      t.hstore :reqs

      t.timestamps
    end
  end
end
