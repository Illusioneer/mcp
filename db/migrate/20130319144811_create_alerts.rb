class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.timestamp :startdate
      t.timestamp :stopdate
      t.hstore :notifiers
      t.string :host
      t.integer :trigger

      t.timestamps
    end
  end
end
