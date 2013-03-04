class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :alarm_id
      t.string :status
      t.timestamp :since
      t.hstore :acknowledged
      t.hstore :metadata

      t.timestamps
    end
  end
end
